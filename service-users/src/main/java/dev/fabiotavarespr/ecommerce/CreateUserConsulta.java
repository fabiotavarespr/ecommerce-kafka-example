package dev.fabiotavarespr.ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class CreateUserConsulta {

    private static Connection connection;

    CreateUserConsulta() throws SQLException {
        String url = "jdbc:sqlite:.data/db/users_database.db";
        this.connection = DriverManager.getConnection(url);
        try {
            connection.createStatement().execute("create table Users(" +
                    "uuid varchar(200) primary key," +
                    "email varchar(200))");
        } catch (SQLException ex) {
            //Be Careful, the sql could be wrong, be reallly careful
        }
    }

    public static void main(String[] args) throws SQLException {
        var createUserService = new CreateUserConsulta();
        createUserService.findAll();
    }

    private void findAll() throws SQLException {
        var query = connection.prepareStatement("select uuid, email from Users");
        var rs = query.executeQuery();
        while (rs.next()) {
            var uuid = rs.getString("uuid");
            var email = rs.getString("email");
            System.out.println("uuid: " + uuid + ", email:" + email);
        }
    }

}
