package com.google.cloud.sql.mysql.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * A sample app that connects to a Cloud SQL instance and lists all available tables in a database.
 */
public class ListTables {
  public static void main(String[] args) throws IOException, SQLException {
    // TODO: fill this in
    // The instance connection name can be obtained from the instance overview page in Cloud Console
    // or by running "gcloud sql instances describe <instance> | grep connectionName".
    String instanceConnectionName = "wspark-cloud-test:asia-east1:wspark-mysql";

    // TODO: fill this in
    // The database from which to list tables.
    String databaseName = "egov";

    String username = "wspark";

    // TODO: fill this in
    // This is the password that was set via the Cloud Console or empty if never set
    // (not recommended).
    String password = "rplinux";

    if (instanceConnectionName.equals("wspark-cloud-test:asia-east1:wspark-mysql")) {
      System.err.println("Please update the sample to specify the instance connection name.");
      System.exit(1);
    }

    if (password.equals("rplinux")) {
      System.err.println("Please update the sample to specify the mysql password.");
      System.exit(1);
    }

    //[START doc-example]
    String jdbcUrl = String.format(
        "jdbc:mysql://google/%s?cloudSqlInstance=%s&"
            + "socketFactory=com.google.cloud.sql.mysql.SocketFactory",
        databaseName,
        instanceConnectionName);
 
    Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
   //[END doc-example]

    try (Statement statement = connection.createStatement()) {
      ResultSet resultSet = statement.executeQuery("SHOW TABLES");
      while (resultSet.next()) {
        System.out.println(resultSet.getString(1));
      }
    }
  }
}
