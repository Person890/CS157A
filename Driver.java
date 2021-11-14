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
//            view menu
            ResultSet resultSet = statement.executeQuery("select * from CoffeeSelection");
            System.out.println("View menu:");
            System.out.println("Drink \t Size \t Price \t");
            while (resultSet.next()){
                System.out.println(resultSet.getString("drink") + "\t"
                        + resultSet.getString("size") + "\t" +
                        resultSet.getString("price"));
            }

//
//            resultSet = statement.executeQuery("insert values into  ");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
