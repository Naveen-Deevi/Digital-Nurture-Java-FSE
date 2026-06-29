class Logger {

    private static Logger instance;

    private Logger() {
        System.out.println("Logger Instance Created");
    }

    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    public void log(String msg) {
        System.out.println(msg);
    }
}

public class Singleton {

    public static void main(String[] args) {

        Logger logger1 = Logger.getInstance();
        logger1.log("Program Started");

        Logger logger2 = Logger.getInstance();
        logger2.log("Logging Another Message");

        System.out.println("Logger 1 : " + logger1);
        System.out.println("Logger 2 : " + logger2);

        if (logger1 == logger2) {
            System.out.println("Only one Logger object exists");
        } else {
            System.out.println("Different Logger objects exist");
        }
    }
}