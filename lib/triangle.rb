class Triangle
    attr_reader :side1, :side2, :side3

    def initialize(side1,side2,side3)
        @side1 = side1
        @side2 = side2
        @side3 = side3
    end

    def kind
        def postive_number
            [side1, side2, side3].all?(&:positive?)
        end

        def triagnle_inequality
            side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
        end

        unless postive_number && triagnle_inequality
            raise TriangleError
        end

        if side1 == side2 && side2 == side3
            return :equilateral
        elsif side1 == side2 || side2 == side3 || side1 == side3
            return :isosceles
        else
            return :scalene
        end
    end


    class TriangleError < StandardError
    end
end
