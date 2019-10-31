import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const cocktails = JSON.parse(document.getElementById('search-data').dataset.cocktails)
  const searchInput = document.getElementById('search_names');

  if (cocktails && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = cocktails;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
