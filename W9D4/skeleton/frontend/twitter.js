const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$( () => {
    let $button = $('.follow-toggle');
    $button.each((idx,ele) => {
    let ft = new FollowToggle(ele);
    });
    let $usersSearch = $(".users-search");
    let us = new UsersSearch($usersSearch);
});
