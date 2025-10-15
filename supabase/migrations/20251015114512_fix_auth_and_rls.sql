/*
  # Fix Authentication and RLS Policies

  1. Changes
    - Add policy for inserting order_items
    - Add policy for users to insert their own profile on signup
    - Remove password_hash requirement (handled by Supabase Auth)

  2. Security
    - Maintain restrictive RLS policies
    - Ensure users can only access their own data
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'order_items' 
    AND policyname = 'Buyers can insert order items'
  ) THEN
    CREATE POLICY "Buyers can insert order items"
      ON order_items FOR INSERT
      TO authenticated
      WITH CHECK (
        EXISTS (
          SELECT 1 FROM orders
          WHERE orders.id = order_items.order_id
          AND orders.buyer_id = auth.uid()
        )
      );
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'users' 
    AND policyname = 'Users can insert own profile'
  ) THEN
    CREATE POLICY "Users can insert own profile"
      ON users FOR INSERT
      TO authenticated
      WITH CHECK (auth.uid() = id);
  END IF;
END $$;

ALTER TABLE users ALTER COLUMN password_hash DROP NOT NULL;