import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Driver {
    public static void main(String[] args) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", 
//             you must add your connection details here (username and password)
            );

            Statement statement = connection.createStatement();

//            15 different functionalities
            ResultSet resultSet = statement.executeQuery("select * from CUSTOMER");

            while (resultSet.next()){
                System.out.println(resultSet.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
