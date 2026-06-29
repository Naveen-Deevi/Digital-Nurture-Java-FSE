class Product {

    int productId;
    String productName;
    String category;

    Product(int id, String name, String cat) {
        productId = id;
        productName = name;
        category = cat;
    }
}

public class EcommerceSearch {

    static Product linearSearch(Product[] arr, int id) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].productId == id) {
                return arr[i];
            }
        }
        return null;
    }

    static Product binarySearch(Product[] arr, int id) {
        int low = 0;
        int high = arr.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;

            if (arr[mid].productId == id) {
                return arr[mid];
            } else if (arr[mid].productId < id) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }

        return null;
    }

    public static void main(String[] args) {

        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Shoes", "Fashion"),
            new Product(103, "Watch", "Accessories"),
            new Product(104, "Phone", "Electronics"),
            new Product(105, "Bag", "Fashion")
        };

        int searchId = 104;

        Product p1 = linearSearch(products, searchId);

        if (p1 != null) {
            System.out.println("Linear Search Found:");
            System.out.println(p1.productId + " " + p1.productName + " " + p1.category);
        } else {
            System.out.println("Product not found");
        }

        Product p2 = binarySearch(products, searchId);

        if (p2 != null) {
            System.out.println("Binary Search Found:");
            System.out.println(p2.productId + " " + p2.productName + " " + p2.category);
        } else {
            System.out.println("Product not found");
        }

        System.out.println("\nAnalysis:");
        System.out.println("Linear Search Time Complexity: O(n)");
        System.out.println("Binary Search Time Complexity: O(log n)");
        System.out.println("Binary Search is faster for large sorted data.");
    }
}