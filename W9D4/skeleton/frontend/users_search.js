class UsersSearch {
  constructor(el) {
    this.usersList = '';
    this.$el = $(el);
    this.$el.on('change', 'input', (e) => {this.searchUsers(e.target.value);});
  }

  searchUsers(query){
    $.ajax({
      method: 'GET',
      data: {query: query},
      dataType: 'JSON',
      success: (data) => {
        this.usersList = data;
        console.log(this.usersList);
      }
    });
  }

  renderResults() {
    
  }
}

module.exports = UsersSearch;