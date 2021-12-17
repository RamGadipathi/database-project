package com.company;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MysqlConnection{
    private static String driver = "com.mysql.jdbc.Driver";
    private static String connection = "jdbc:mysql://database-1.cakawovuaaz8.us-east-1.rds.amazonaws.com";
    private static String user = "admin";
    private static String password = "d32rfec334r3";


    private static Connection con = null;
    private static Statement state = null;
    private static ResultSet result;
    private static PreparedStatement processstate;

    public static void main(String args[])/* throws Exception*/{
        mysqlConnect();
        insertingData("raja","milon","dgh@gmail.com","435-334-2435","hyderabad");
        deletingData("santosh");
        countingRow("User_Info");
        updatingData("shwann", "shwann");
        showingData("shwan");
        closeConnection();
    }


    public static void mysqlConnect(){
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(connection, user, password);
            System.out.println("Successfully connected to database.");
        }
        catch(ClassNotFoundException e){
            System.err.println("Couldn't load driver.");
        }
        catch(SQLException e){
            System.err.println("Couldn't connect to database.");
        }
    }


    public static void closeConnection(){
        try{
            if(!con.isClosed()){
                con.close();
                System.out.println("Database closed successfully.");
            }
        }
        catch(NullPointerException e){
            System.err.println("Couldn't load driver.");
        }
        catch(SQLException e){
            System.err.println("Couldn't close database.");
        }
    }

    public static void insertingData(String User_InfoFirstName, String User_InfoLstName, String User_Infoemail,String User_InfoPhonenum , String User_InfoCity){
        try{
            processstate = con.prepareStatement("insert into User_Info(User_InfoFirstName,User_InfoLstName,User_Infoemail,User_InfoPhonenum,User_InfoCity)"+
                    "values(?,?,?,?,?)");
            processstate.setString(1, User_InfoFirstName);
            processstate.setString(2, User_InfoLstName);
            processstate.setString(3, User_Infoemail);
            processstate.setString(4, User_InfoPhonenum);
            processstate.setString(5, User_InfoCity);
            int value = processstate.executeUpdate();
            System.out.println("Query OK, 1 row inserted.");
        }
        catch(SQLException e){
            System.err.println("Query error.");
        }
    }

    public static void deletingData(String User_InfoFirstName1){
        try{
            processstate = con.prepareStatement("delete from User_Info where User_InfoFirstName = ?");
            processstate.setString(1,"User_InfoFirstName1");
            int value = processstate.executeUpdate();
            System.out.println("Query OK, 1 row deleted.");
        }
        catch(SQLException e){
            System.err.println("Query error.");
        }
    }

    public static void countingRow(String table){
        try{
            result = state.executeQuery("SELECT COUNT(*) FROM "+table);
            result.next();
            int rowcount = result.getInt(1);
            System.out.println("Number of rows: "+rowcount);
        }
        catch(SQLException e){
            System.err.println("Query error.");
        }
    }

    public static void showingData(String word){
        try{
            state = con.createStatement();
            result = state.executeQuery("select * from User_Info where word='"+word+"'");
            while(result.next()){
                String wor1d11 = result.getString("User_InfoFirstName");
                String me1an = result.getString("User_InfoLstName");
                String sy1no = result.getString("User_Infoemail");
                String an1to = result.getString("User_InfoPhonenum");
                System.out.println("firstname: "+wor1d11+" lastname: "+me1an+" email: "+sy1no+" phoneno: "+an1to);
            }
        }
        catch(SQLException e){
            System.err.println("we had Query error has occured.");
        }
        catch(NullPointerException e){
            System.err.println("record not found.");
        }
    }

    public static void updatingData(String User_ChangeName, String User_InfoFirstName){
        try{
            processstate = con.prepareStatement("update User_Info set User_InfoFirstName= ? where word = ?");
            processstate.setString(1, User_InfoFirstName);
            processstate.setString(2, User_ChangeName);
            processstate.executeUpdate();

            System.out.println("Query OK, 1 row updated.");
        }
        catch(SQLException e){
            System.err.println("Query error."+e.getMessage());
        }
    }

}
  
