class AddDefaultValueToFirstNameAndName < ActiveRecord::Migration
  def change
    def up
      change_column_default :users, :name, ''
      change_column_null :users, :name, false

      change_column_default :users, :firstname, ''
      change_column_null :users, :firstname, false
    end

    def down
      change_column_default :users, :name, nil
      change_column_null :users, :name, true

      change_column_default :users, :firstname, nil
      change_column_null :users, :firstname, true
    end

  end
end
