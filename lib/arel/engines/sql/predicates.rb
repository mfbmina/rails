module Arel
  class Binary < Predicate
    def to_sql(formatter = nil)
      "#{operand1.to_sql} #{predicate_sql} #{operand1.format(operand2)}"
    end
  end

  class Equality < Binary
    def predicate_sql
      operand2.equality_predicate_sql
    end
  end

  class GreaterThanOrEqualTo < Binary
    def predicate_sql; '>=' end
  end

  class GreaterThan < Binary
    def predicate_sql; '>' end
  end

  class LessThanOrEqualTo < Binary
    def predicate_sql; '<=' end
  end

  class LessThan < Binary
    def predicate_sql; '<' end
  end

  class Match < Binary
    def predicate_sql; 'LIKE' end
  end

  class In < Binary
    def predicate_sql; operand2.inclusion_predicate_sql end
  end
end
