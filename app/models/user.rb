class User < ApplicationRecord
    before_save {self.email.downcase!}
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255},
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :houseworks
    has_many :housework_schedules
    has_many :relationships
    has_many :offerings, through: :relationships, source: :partner
    has_many :reverses_of_relationship, class_name: "Relationship", foreign_key: "partner_id"
    has_many :receivings, through: :reverses_of_relationship, source: :user
    
    def offer(other_user, secret_words, status)
        unless self == other_user
            self.relationships.find_or_create_by(partner_id: other_user.id)
            self.relationships.update(secret_words: secret_words, status: status)
        end
    end
    
    def dissolve(other_user)
        relationship = self.relationships.find_by(partner_id: other_user.id)
        relationship.destroy if relationship
    end
    
    def offering?(other_user)
        self.offerings.include?(other_user)
    end
    
    def receiving?(other_user)
        self.receivings.include?(other_user)
    end
    
end