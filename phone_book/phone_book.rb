class String
    ADAN = %w[ア カ サ タ ナ ハ マ ヤ ラ ワ]
  
    def adan
      ADAN[ADAN.index{|dan| dan == self[0]} || ADAN.index{|dan| dan > self[0]} - 1 ]
    end
  end
  
  class NameIndex
    class << self
      def create_index(names)
        names.sort.inject(Hash.new{|h,k| h[k] = []}){|h, name| h[name.adan] << name;h}.to_a
      end
      def create_index_by_group_by(names)
        names.sort.group_by(&:adan).to_a
      end
    end
  end
  
  p NameIndex.create_index(['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ', 'ホリカワ', 'ドバシ'])
  p NameIndex.create_index_by_group_by(['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ', 'ホリカワ', 'ドバシ'])