class SetUsersDefaultLastNotifiedToNow < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute """
      UPDATE users SET last_notified = now() WHERE last_notified IS NULL
                                          """

    ActiveRecord::Base.connection.execute """
      ALTER TABLE users ALTER COLUMN last_notified SET DEFAULT now()
"""

  end

  def down

  end
end
