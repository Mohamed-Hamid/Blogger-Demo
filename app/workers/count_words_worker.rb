class CountWordsWorker
   @queue = :count_words

   def self.perform
  	word_count = Comment.total_word_count
    comment_statistic = Statistic.find_by(title: 'comment')
    comment_statistic.count = word_count
    comment_statistic.save
   end

   def self.before_enqueue
     @time = Time.now
   end

   def self.after_enqueue
     comment_statistic = Statistic.find_by(title: 'comment')
     comment_statistic.time_taken = Time.now - @time
     comment_statistic.save
   end
end