class GameModel {
  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 1;

  int target;
  int current;
  int totalScore;
  int round;

  GameModel(this.target,
      [this.current = sliderStart,
      this.totalScore = scoreStart,
      this.round = roundStart]);

  int getCurrent() {
    return current;
  }

  void setCurrent(current) {
    this.current = current;
  }

  int getTotalScore() {
    return totalScore;
  }

  void setTotalScore(totalScore) {
    this.totalScore = totalScore;
  }

  void addToTotalScore(int pointsToAdd) {
    totalScore += pointsToAdd;
  }

  int getRound() {
    return round;
  }

  void nextRound() {
    round++;
  }

  int getTarget() {
    return target;
  }

  void setTarget(target) {
    this.target = target;
  }
}
