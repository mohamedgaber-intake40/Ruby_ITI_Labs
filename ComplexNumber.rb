class ComplexNumber
    attr_accessor :real, :imagin
     @@stats = {add: 0,multiply: 0,bulk_multiply: 0,bulk_add: 0}

    def initialize(real,imagin)
        @real=real
        @imagin=imagin
    end

    def +(obj)
        @@stats[:add] += 1
        return ComplexNumber.new(@real + obj.real , @imagin + obj.imagin)
    end

    def *(obj) 
        @@stats[:multiply] += 1
        return ComplexNumber.new((@real*obj.real - @imagin*obj.imagin),(@real*obj.imagin + @imagin*obj.real))
    end

    def self.bulk_add(complexNumbers)
        @@stats[:bulk_add] += 1
        result = ComplexNumber.new(0,0)
        complexNumbers.each{ |complexNumber| result += complexNumber }
        return result
    end

    def self.bulk_multiply(complexNumbers)
        @@stats[:bulk_multiply] += 1
        result = complexNumbers[0]
        complexNumbers.drop(1).each{ |complexNumber| result *=  complexNumber }
        return result
    end

    def self.get_stats()
        puts @@stats
    end

    def print()
        puts"#{@real} + #{@imagin}i"
    end
end


# obj=ComplexNumber.new(3,2)
# obj2=ComplexNumber.new(1,7)


# obj3=obj+obj2
# puts obj3.print

# obj3=obj*obj2
# puts obj3.print

# ComplexNumber.bulk_add([obj,obj2]).print 


# ComplexNumber.bulk_multiply([obj,obj2]).print


# ComplexNumber.get_stats


