Sequel.migration do
  up do
    create_table(:computers) do
      primary_key :id
      String :brand, :null=>false
      String :color
      Integer :size
      Integer :ram, default: 4
    end
  end

  down do
    drop_table(:computers)
  end
end