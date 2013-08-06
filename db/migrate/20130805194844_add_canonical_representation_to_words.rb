class AddCanonicalRepresentationToWords < ActiveRecord::Migration
  def change
    add_column :words, :canonical_representation, :string
    add_index :words, :canonical_representation
  end
end
