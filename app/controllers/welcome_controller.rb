class WelcomeController < ApplicationController
    def home
        
    end
    def about
        
    end
    def contact
        
    end
    def thankyou
        @full_name = params[:full_name]
    end

    def phpinfo
        # @result = system('php public/phpinfo.php')
       # @result =puts system('ls')
        IO.popen(["ls", "./", :err=>[:child, :out]]) {|ls_io|
            @ls_result_with_error = ls_io.read 
        }
        #byebug
        
    end

end
