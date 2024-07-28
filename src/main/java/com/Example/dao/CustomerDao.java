package com.Example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Example.models.CustomerProfile;
import com.Example.models.DislikedProductModel;
import com.Example.models.FeedbackModel;
import com.Example.models.LikedProductModel;
import com.Example.models.PasswordChangeRequest;
import com.Example.models.ActiveProducts;
import com.Example.models.AdminModel;
import com.Example.models.CustomerLoginModel;
import com.Example.models.CustomerModel;
import com.Example.models.Product;
import com.Example.models.ProductCollectionModel;
import com.Example.models.UpdateModel;
import com.Example.models.contactusmodel;
import com.Example.models.getDislikedProduct;
import com.Example.models.getlikedProduct;
import com.Example.util.DBConnection;
/**
 * The CustomerDao class implements the CustomerDaoInterface and provides
 * methods to interact with the customer-related data in the database.
 * It includes functionalities for customer registration, login, product
 * management, and user interactions such as liking or disliking products.
 */
public class CustomerDao implements CustomerDaoInterface {
	String status = "Failure";

    /**
     * Inserts a new customer into the database.
     *
     * @param cm The CustomerModel object containing customer information.
     * @return A string indicating the success or failure of the operation.
     */

	@Override
	public String insert(CustomerModel cm) {
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO Customer (CName, CUserID, Gmail, PhoneNo, Pass) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, cm.getFullName());
			ps.setString(2, cm.getUserId());
			ps.setString(3, cm.getGmail());
			ps.setString(4, cm.getPhoneno());
			ps.setString(5, cm.getPassWord());

			int n = ps.executeUpdate();
			System.out.println("no of rows inserted=" + n);

			if (n > 0) {
				status = "Success";
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	@Override
	public String adminlogin(AdminModel am) {
		/**
		 * Authenticates an admin user by checking the provided credentials against the database.
		 *
		 * @param am The AdminModel object containing admin credentials (username and password).
		 * @return A string indicating the success or failure of the authentication.
		 */

		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ADMIN WHERE ADMINID = ? AND PASSWORD =?");
			ps.setString(1, am.getAdminName());
			ps.setString(2, am.getAdminPass());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = "Success";
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	@Override
	public String customerlogin(CustomerLoginModel clm) {
		/**
		 * Attempts to log in a customer by verifying their user ID and password.
		 *
		 * @param clm The CustomerLoginModel object containing the user ID and password.
		 * @return A string indicating the success or failure of the login operation.
		 */
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE CUserID=? AND Pass=?");
			ps.setString(1, clm.getUserId());
			ps.setString(2, clm.getPassWord());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = "Success";
				System.out.println(clm.getUserId());
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	@Override
	public String checkUserID(String userID) {
		/**
		 * Checks if a given user ID exists in the Customer table of the database.
		 *
		 * @param userID The user ID to be checked for existence.
		 * @return A string indicating the status of the operation:
		 *         - "Success" if the user ID does not exist in the database.
		 *         - "Failure" if the user ID already exists in the database.
		 *         - "Error" if an exception occurs during database operation.
		 */
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE CUserID = ?");
			ps.setString(1, userID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = "Failure";
			} else {
				status = "Success";
			}
		} catch (Exception e) {
			System.out.println(e);
			status = "Error";
		}

		return status;
	}
/*
 * --------------------------------------------------------------------------------------------------------------------------------------------
 * here is is unimplemented method 
 */
	@Override
	public String updateUserName(UpdateModel um) {
		// Implement this method if needed
		return null;
		
	}
/*
 * ---------------------------------------------------------------------------------------------------------------------------------------------
 */

	@Override
	public List<Product> getProducts() {
		/**
		 * Retrieves a list of products from the database.
		 * Each product includes its image path, name, and price.
		 *
		 * @return A list of Product objects representing the products retrieved from the database.
		 */

		List<Product> products = new ArrayList<>();

		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			String sql = "SELECT image_path, product_name, product_price FROM products";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String imagePath = rs.getString("image_path");
				String productName = rs.getString("product_name");
				double productPrice = rs.getDouble("product_price");

				Product product = new Product(imagePath, productName, productPrice);
				products.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<CustomerProfile> profileDet(CustomerLoginModel clm) {
		/**
		 * Retrieves customer profile details based on the provided CustomerLoginModel.
		 * Searches the database for customer information associated with the provided
		 * user ID (CUserID) and constructs CustomerProfile objects for each result.
		 *
		 * @param clm The CustomerLoginModel containing the user ID (CUserID) to search for.
		 * @return A List of CustomerProfile objects containing profile details of the matching customers.
		 */
		List<CustomerProfile> customers = new ArrayList<>();

		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT CID , Cname, cuserid, gmail, phoneno FROM skincare.customer WHERE CUserID = ?");
			ps.setString(1, clm.getUserId());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int cid = rs.getInt("CID");
				String customerId = rs.getString("cuserid");
				String name = rs.getString("Cname");
				String email = rs.getString("gmail");
				String phoneNumber = rs.getString("phoneno");

				CustomerProfile customer = new CustomerProfile(cid ,customerId, name, email, phoneNumber);
				customers.add(customer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		System.out.println(clm.getUserId());


		return customers;
	}

	@Override
	public String passwordChange(PasswordChangeRequest PCR) {
		/**
		 * Updates the password of a customer in the database based on the provided PasswordChangeRequest.
		 * Checks if the current password (previous password) matches before updating to the new password.
		 *
		 * @param PCR The PasswordChangeRequest object containing customer's current and new passwords.
		 * @return A String indicating the status of the password change operation: "Success" or "Failure".
		 */
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE customer SET pass = ? WHERE cuserid = ? AND pass = ?");
			ps.setString(1, PCR.getNewPassword());
			ps.setString(2, PCR.getCustomerId());
			ps.setString(3, PCR.getPreviousPassword());
			System.out.println("daodata"+ PCR.getCustomerId());

			int n = ps.executeUpdate(); 

			if (n > 0) {
				status = "Success";
			} else {
				status = "Failure";
			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	@Override
	 public String adminProdAdd(ProductCollectionModel pcm) {
		/**
		 * Inserts a new product into the database based on the provided ProductCollectionModel.
		 * The product is added with a default status of 'active'.
		 *
		 * @param pcm The ProductCollectionModel containing details of the product to be added,
		 *            including product name, price, and image.
		 * @return A string indicating the status of the insertion operation ('Success' or 'Failure').
		 */
		
        try {
            DBConnection db = new DBConnection();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO product (product_name, product_price, product_image, is_active) VALUES (?, ?, ?, 'active')");
            ps.setString(1, pcm.getProductName());
            ps.setString(2, pcm.getProductPrice());
            ps.setString(3, pcm.getProductImage());
            
            int n = ps.executeUpdate();
            if (n > 0) {
                status = "Success";
            }

          
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }
	public List<ActiveProducts> getActiveProducts() {
		/**
		 * Retrieves a list of active products from the database.
		 * Queries the database to fetch products marked as 'active' and constructs
		 * ActiveProducts objects for each retrieved record.
		 *
		 * @return A List of ActiveProducts objects containing details of active products.
		 */
	    List<ActiveProducts> products = new ArrayList<>();
	    try {
	        DBConnection db = new DBConnection();
	        Connection con = db.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT product_id, product_name, product_price, product_image FROM product WHERE is_active = 'active'");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            // Using an empty constructor and setting properties
	            ActiveProducts ap = new ActiveProducts();
	            ap.setProduct_id(rs.getInt("product_id"));
	            ap.setProductName(rs.getString("product_name"));
	            ap.setProductPrice(rs.getString("product_price"));
	            ap.setProductImage(rs.getString("product_image"));
	            products.add(ap);
	        }
	      
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return products;
	}
	//  this is the liked servelet
	public String insertLikedData(CustomerLoginModel comm, LikedProductModel lpm) {
		/**
		 * Inserts or removes a 'liked' operation for a specific customer and product.
		 * Checks if the customer exists based on the provided CustomerLoginModel,
		 * retrieves the customer ID (CID), and then verifies if a 'liked' operation
		 * already exists for the given product ID (lpm.getProductid()). If such an operation
		 * exists, it removes it; otherwise, it inserts a new 'liked' operation into the database.
		 *
		 * @param comm The CustomerLoginModel containing the customer's login details.
		 * @param lpm  The LikedProductModel containing the product ID for which the operation is performed.
		 * @return A String indicating the status of the operation: "Success" if inserted or removed successfully,
		 *         "Failure" if an error occurred or the operation failed, or "Removed" if an existing 'liked' operation
		 *         was successfully removed.
		 */
	    try {
	        DBConnection db = new DBConnection();
	        Connection con = db.getConnection();

	        // Retrieve customer details from profile
	        PreparedStatement ps = con.prepareStatement("SELECT CID FROM Customer WHERE CUSERID = ?");
	        ps.setString(1, comm.getUserId());
	        ResultSet rs = ps.executeQuery();

	        int cid = 0;
	        if (rs.next()) {
	            cid = rs.getInt("CID");
	        } else {
	            System.out.println("Customer with CUserID " + comm.getUserId() + " not found.");
	            return "Failure";
	        }

	        // Check if the like operation already exists
	        PreparedStatement checkStmt = con.prepareStatement(
	            "SELECT operation_id FROM customer_operation WHERE CID = ? AND product_id = ? AND operation_type = 'liked'");
	        checkStmt.setInt(1, cid);
	        checkStmt.setInt(2, lpm.getProductid());
	        ResultSet checkRs = checkStmt.executeQuery();

	        if (checkRs.next()) {
	            // If it exists, remove it
	            int operationId = checkRs.getInt("operation_id");
	            PreparedStatement deleteStmt = con.prepareStatement(
	                "DELETE FROM customer_operation WHERE operation_id = ?");
	            deleteStmt.setInt(1, operationId);
	            int deleteResult = deleteStmt.executeUpdate();
	            if (deleteResult > 0) {
	                status = "Removed";
	            } else {
	                status = "Failure";
	            }
	        } else {
	            // If it does not exist, insert a new like operation
	            PreparedStatement insertStmt = con.prepareStatement(
	                "INSERT INTO customer_operation (CID, product_id, operation_type) VALUES (?, ?, 'liked')");
	            insertStmt.setInt(1, cid);
	            insertStmt.setInt(2, lpm.getProductid());
	            int insertResult = insertStmt.executeUpdate();
	            if (insertResult > 0) {
	                status = "Success";
	            } else {
	                status = "Failure";
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        status = "Failure";
	    }
	    return status;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	public String insertDislikedData(CustomerLoginModel comm, LikedProductModel lpm) {
		/**
		 * Inserts or removes a 'disliked' operation for a specific customer and product.
		 * Checks if the customer exists based on the provided CustomerLoginModel,
		 * retrieves the customer ID (CID), and then verifies if a 'disliked' operation
		 * already exists for the given product ID (lpm.getProductid()). If such an operation
		 * exists, it removes it; otherwise, it inserts a new 'disliked' operation into the database.
		 *
		 * @param comm The CustomerLoginModel containing the customer's login details.
		 * @param lpm  The LikedProductModel containing the product ID for which the operation is performed.
		 * @return A String indicating the status of the operation: "Success" if inserted or removed successfully,
		 *         "Failure" if an error occurred or the operation failed, or "Removed" if an existing 'disliked' operation
		 *         was successfully removed. Returns "Failure" if the customer with the given CUserID is not found.
		 */
	    String status = "Failure";
	    try {
	        DBConnection db = new DBConnection();
	        Connection con = db.getConnection();

	        // Retrieve customer details from profile
	        PreparedStatement ps = con.prepareStatement("SELECT CID FROM Customer WHERE CUSERID = ?");
	        ps.setString(1, comm.getUserId());
	        ResultSet rs = ps.executeQuery();

	        int cid = 0;
	        if (rs.next()) {
	            cid = rs.getInt("CID");
	        } else {
	            System.out.println("Customer with CUserID " + comm.getUserId() + " not found.");
	            return status;
	        }

	        // Check if the dislike operation already exists
	        PreparedStatement checkStmt = con.prepareStatement(
	            "SELECT operation_id FROM customer_operation WHERE CID = ? AND product_id = ? AND operation_type = 'disliked'");
	        checkStmt.setInt(1, cid);
	        checkStmt.setInt(2, lpm.getProductid());
	        ResultSet checkRs = checkStmt.executeQuery();

	        if (checkRs.next()) {
	            // If it exists, remove it
	            int operationId = checkRs.getInt("operation_id");
	            PreparedStatement deleteStmt = con.prepareStatement(
	                "DELETE FROM customer_operation WHERE operation_id = ?");
	            deleteStmt.setInt(1, operationId);
	            int deleteResult = deleteStmt.executeUpdate();
	            if (deleteResult > 0) {
	                status = "Removed";
	            } else {
	                status = "Failure";
	            }
	        } else {
	            // If it does not exist, insert a new dislike operation
	            PreparedStatement insertStmt = con.prepareStatement(
	                "INSERT INTO customer_operation (CID, product_id, operation_type) VALUES (?, ?, 'disliked')");
	            insertStmt.setInt(1, cid);
	            insertStmt.setInt(2, lpm.getProductid());
	            int insertResult = insertStmt.executeUpdate();
	            if (insertResult > 0) {
	                status = "Success";
	            } else {
	                status = "Failure";
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	// get liked data into the presentation layer 
	 public List<getlikedProduct> getLikedProductsByUserId(String userId) {
		 /**
		  * Retrieves a list of products liked by a customer based on their user ID (CUSERID).
		  * Searches for the customer's CID using the provided user ID, then queries the database
		  * to fetch products that the customer has liked (operation_type = 'liked').
		  * Constructs and populates instances of getlikedProduct for each liked product found.
		  * Returns an empty list if no customer is found with the given user ID or if no liked products are found.
		  *
		  * @param userId The user ID (CUSERID) of the customer whose liked products are to be retrieved.
		  * @return A list of getlikedProduct instances representing products liked by the customer.
		  *         Returns an empty list if the customer with the given user ID is not found or if no liked products are found.
		  */
	        List<getlikedProduct> likedProducts = new ArrayList<>();

	        try {
	            DBConnection db = new DBConnection();
	            Connection con = db.getConnection();

	            // Retrieve customer CID using userId
	            PreparedStatement ps = con.prepareStatement("SELECT CID FROM Customer WHERE CUSERID = ?");
	            ps.setString(1, userId);
	            ResultSet rs = ps.executeQuery();

	            int cid = 0;
	            if (rs.next()) {
	                cid = rs.getInt("CID");
	            } else {
	                System.out.println("Customer with CUSERID " + userId + " not found.");
	                return likedProducts;
	            }

	            // Query to get liked products
	            PreparedStatement likedStmt = con.prepareStatement(
	                    "SELECT p.product_id, p.product_name, p.product_price, p.product_image " +
	                    "FROM customer_operation co " +
	                    "JOIN product p ON co.product_id = p.product_id " +
	                    "WHERE co.CID = ? AND co.operation_type = 'liked'");
	            likedStmt.setInt(1, cid);
	            ResultSet likedRs = likedStmt.executeQuery();

	            // Iterate through the result set and add liked products to the list
	            while (likedRs.next()) {
	                int productId = likedRs.getInt("product_id");
	                String productName = likedRs.getString("product_name");
	                String productPrice = likedRs.getString("product_price");
	                String productImage = likedRs.getString("product_image");

	                getlikedProduct getlikedproduct = new getlikedProduct(productId, productName, productPrice, productImage);
	                likedProducts.add(getlikedproduct);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return likedProducts;
	    }

	public String getcontactdet(contactusmodel cum) {
		 try {
	            DBConnection db = new DBConnection();
	            Connection con = db.getConnection();
	            PreparedStatement ps = con.prepareStatement("INSERT INTO CONTACTUS VALUES (?, ?, ?)");
	            ps.setString(1, cum.getName());
	            ps.setString(2, cum.getEmail());
	            ps.setString(3, cum.getMessage());
	            
	            int n = ps.executeUpdate();
	            if (n > 0) {
	                status = "Success";
	            }

	          
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return status;
		}	 
	
	public String saveFeedback(FeedbackModel feedback)  {
        String status = "Failure";
        try {
            DBConnection db = new DBConnection();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO FEEDBACK (NAME, EMAIL, MESSAGE) VALUES (?, ?, ?)");
            ps.setString(1, feedback.getName());
            ps.setString(2, feedback.getEmail());
            ps.setString(3, feedback.getMessage());

            int n = ps.executeUpdate();
            if (n > 0) {
                status = "Success";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public String deleteProduct(String productId) {
	    try {
	        DBConnection db = new DBConnection();
	        Connection con = db.getConnection();
	        PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE product_NAME = ?");
	        ps.setString(1, productId);

	        int n = ps.executeUpdate();
	        if (n > 0) {
	            status = "Success";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 public String insertDislikedData(CustomerLoginModel customer, DislikedProductModel dislikedProduct) {
	        String status = "";
	        try {
	            DBConnection db = new DBConnection();
	            Connection con = db.getConnection();

	            // Retrieve customer CID using userId
	            PreparedStatement ps = con.prepareStatement("SELECT CID FROM Customer WHERE CUSERID = ?");
	            ps.setString(1, customer.getUserId());
	            ResultSet rs = ps.executeQuery();

	            int cid = 0;
	            if (rs.next()) {
	                cid = rs.getInt("CID");
	            } else {
	                System.out.println("Customer with CUSERID " + customer.getUserId() + " not found.");
	                return "Customer not found";
	            }

	            // Insert disliked product into database
	            PreparedStatement insertStmt = con.prepareStatement(
	                    "INSERT INTO customer_operation (CID, product_id, operation_type) VALUES (?, ?, 'disliked')");
	            insertStmt.setInt(1, cid);
	            insertStmt.setInt(2, dislikedProduct.getProductId());

	            int rowsAffected = insertStmt.executeUpdate();
	            if (rowsAffected > 0) {
	                status = "Success";
	            } else {
	                status = "Failed to insert disliked product";
	            }

	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    // Method to remove disliked product data
	    public String removeDislikedData(CustomerLoginModel customer, DislikedProductModel dislikedProduct) {
	        String status = "";
	        try {
	            DBConnection db = new DBConnection();
	            Connection con = db.getConnection();

	            // Retrieve customer CID using userId
	            PreparedStatement ps = con.prepareStatement("SELECT CID FROM Customer WHERE CUSERID = ?");
	            ps.setString(1, customer.getUserId());
	            ResultSet rs = ps.executeQuery();

	            int cid = 0;
	            if (rs.next()) {
	                cid = rs.getInt("CID");
	            } else {
	                System.out.println("Customer with CUSERID " + customer.getUserId() + " not found.");
	                return "Customer not found";
	            }

	            // Remove disliked product from database
	            PreparedStatement deleteStmt = con.prepareStatement(
	                    "DELETE FROM customer_operation WHERE CID = ? AND product_id = ? AND operation_type = 'disliked'");
	            deleteStmt.setInt(1, cid);
	            deleteStmt.setInt(2, dislikedProduct.getProductId());

	            int rowsAffected = deleteStmt.executeUpdate();
	            if (rowsAffected > 0) {
	                status = "Success";
	            } else {
	                status = "Failed to remove disliked product";
	            }

	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }

	    // Method to get disliked products by user ID
	    public List<getDislikedProduct> getDislikedProductsByUserId(String userId) {
	        List<getDislikedProduct> dislikedProducts = new ArrayList<>();

	        try {
	            DBConnection db = new DBConnection();
	            Connection con = db.getConnection();

	            // Retrieve customer CID using userId
	            PreparedStatement ps = con.prepareStatement("SELECT CID FROM Customer WHERE CUSERID = ?");
	            ps.setString(1, userId);
	            ResultSet rs = ps.executeQuery();

	            int cid = 0;
	            if (rs.next()) {
	                cid = rs.getInt("CID");
	            } else {
	                System.out.println("Customer with CUSERID " + userId + " not found.");
	                return dislikedProducts;
	            }

	            // Query to get disliked products
	            PreparedStatement dislikedStmt = con.prepareStatement(
	                    "SELECT p.product_id, p.product_name, p.product_price, p.product_image " +
	                    "FROM customer_operation co " +
	                    "JOIN product p ON co.product_id = p.product_id " +
	                    "WHERE co.CID = ? AND co.operation_type = 'disliked'");
	            dislikedStmt.setInt(1, cid);
	            ResultSet dislikedRs = dislikedStmt.executeQuery();

	            // Iterate through the result set and add disliked products to the list
	            while (dislikedRs.next()) {
	                int productId = dislikedRs.getInt("product_id");
	                String productName = dislikedRs.getString("product_name");
	                String productPrice = dislikedRs.getString("product_price");
	                String productImage = dislikedRs.getString("product_image");

	                getDislikedProduct getDislikedProduct = new getDislikedProduct(productId, productName, productPrice, productImage);
	                dislikedProducts.add(getDislikedProduct);
	            }

	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return dislikedProducts;
	    }
	}

