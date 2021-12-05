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

          
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

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

//          hire new employee
            ResultSet resultSet2 = statement.executeQuery("select * from Employee");
            resultSet2.moveToInsertRow();
            resultSet2.updateInt("employeeID", 111);
            resultSet2.updateString("name", "Patrick");
            resultSet2.updateString("position", "barista");
            resultSet2.updateDouble("salary", 22.00);

            resultSet2.insertRow();

            resultSet2.beforeFirst();

            System.out.println("Displaying record after the Insert...");

            while(resultSet2.next())
            {
                int employeeID = resultSet2.getInt("employeeID");
                String name = resultSet2.getString("name");
                String position = resultSet2.getString("position");
                double salary = resultSet2.getDouble("salary");
                System.out.println("ID: " + employeeID + " Name:" + name + " Position: " + position + " Salary: $" + salary);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     public static void archive(){
        Statement statement1 = null;
        ResultSet result = null;
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe",
                    "root", "skakalpes");

            String statement = "CALL ARCHIVEDTRANSACTION(?)";
            PreparedStatement preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, "2021-12-05 00:00:00");
            boolean result1 = preparedStatement.execute();

            if(!result1){
                System.out.println("There was an issue with the statement");
            }
        }
        catch (SQLException sl){
            sl.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                if(statement1 != null){
                    statement1.close();
                }

            }catch(SQLException sl2){

            }
        }
    }
}
