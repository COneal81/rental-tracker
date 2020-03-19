# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project 
        ~ Yes, I used Ruby on Rails.

- [x] Include at least one has_many relationship (x has_many y; e.g. 
        ~ User has_many Recipes) User has_many :rental_properties

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) 
        ~ RentalProperty belongs_to :user

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        ~ User has_many :repairs, through: :rental_properties
        ~ Supply has_many :repairs, through: :repair_supplies

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        ~ Repair has_many :supplies, through: :repair_supplies
        ~ Supply has_many :repairs, through: :repair_supplies
        ~ RepairSupply  belongs_to :repair 
                        belongs_to :supply 

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        ~ On the repair form, a user can submit a new supply_name and save it to the supply list.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        ~ Models all have reasonable validations.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        ~ 2 scope methods in the RentalProperty model for Available Properties(properties that are not currently being leased)      and Affordable Available Propeties(properties that are not currently being leased and have a monthly rental amount        under $700.00).  Both scopes also only display the curreny users properties.

- [x] Include signup (how e.g. Devise)
        ~ Bcrypt

- [x] Include login (how e.g. Devise)
         ~ Bcrypt

- [x] Include logout (how e.g. Devise)
         ~ Bcrypt

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
         ~ Gmail

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
         ~  ex. rental_properties/62/tenants/79?

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        ~ ex. users/21/rental_properties/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
       
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
