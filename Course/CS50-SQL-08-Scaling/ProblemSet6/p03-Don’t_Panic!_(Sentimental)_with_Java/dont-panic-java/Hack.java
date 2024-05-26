import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Base64;

public class Hack {
    public static void main(String[] args) throws Exception {

        String query = """
                UPDATE "users"
                SET "password"= ?
                WHERE "username" = 'admin'
                    ;
                    """;
        var text = "Hacked!";
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(text.getBytes(StandardCharsets.UTF_8));
        String encoded = Base64.getEncoder().encodeToString(hash);

        try {
            Connection sqliteConnection = DriverManager.getConnection("jdbc:sqlite:dont-panic.db");
            PreparedStatement sqliteStatement = sqliteConnection.prepareStatement(query);
            sqliteStatement.setString(1, encoded);

            sqliteStatement.executeUpdate();
            sqliteConnection.close();

        } catch (Exception e) {
            // if the error message is "out of memory",
            // it probably means no database file is found
            System.err.println(e.getMessage());
        }

    }
}
