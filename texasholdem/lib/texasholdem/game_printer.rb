class GamePrinter
  
  def initialize(sort_strategy=nil)
    self.sort_stategy = sort_strategy
  end
  
  def print(hands)
    sort(hands).each(&:to_s)
  end
  
  private
  
    attr_accessor :sort_strategy
    
    def sort(hands)
      return hands unless sort_strategy
      sort_strategy.sort(hands)
    end
  
end