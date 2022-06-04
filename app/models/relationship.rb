class Relationship < ApplicationRecord
<<<<<<< HEAD
end
=======
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
>>>>>>> a5ddf00e50120178f6b5ca7b3700258da0169c0a
