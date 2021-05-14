class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.$el.on('click',(e) => this.handleClick(e));
    this.render();
  }
  render(){
    this.$el.text(this.followState === 'followed' ? 'Unfollow' : 'Follow');
  }

  handleClick(e){
    e.preventDefault();
    $.ajax({
      method: this.followState === 'followed' ? 'DELETE' : 'POST',
      url: `/users/${this.userId}/follow`,
      dataType: 'JSON',
      success: () => {
        this.followState === "followed" ? this.followState = "unfollowed" : this.followState = "followed";
        this.render();
      }
    });
  }
}


module.exports = FollowToggle;