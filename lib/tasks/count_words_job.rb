class CountWordsJob

  def perform
    comment_statistic = Statistic.find_by(title: 'comment')
    comment_statistic.count = Comment.total_word_count
    comment_statistic.save
  end
end
