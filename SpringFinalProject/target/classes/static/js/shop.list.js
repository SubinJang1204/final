// Filter Functions
$(function() {
  const filters = $('.filter');
  const filterItems = $('.filter').find('input[type="checkbox"]');
  const filterStatus = $('.filter-status');
  const filterStatusView = $('.shop-filter-status');

  function getFilter(name) {
    const filterData = filters.find(`input[name="${name}"]`).filter(function() {
      return this.checked;
    }).map(function() {
      return this.value;
    }).toArray();

    return filterData.join(',');
  }

  function getFilterAll() {
    const filterData = filters.find(`input[name]`).filter(function() {
      return this.checked;
    }).map(function() {
      return $(this).next('span').text();
    }).toArray();

    return filterData;
  }

  function handleChangeFilter() {
    const filterData = getFilterAll();
    
    filters.each(function() {
      const filter = $(this);
      const items = filter.find('input[type="checkbox"]').filter(function() {
        return this.checked;
      }).map(function() {
        return $(this).next('span').text();
      }).toArray();
  
      const filterText = filter.find('.filter-text');
      if (items.length) {
        filterText.text(items.join(', '));
        filter.addClass('filtered');
      } else {
        const filterName = filter.find('.filter-name');
        filterText.text(`모든 ${filterName.text()}`);
        filter.removeClass('filtered');
      }
    });

    if (filterItems.filter(function() {
      return this.checked;
    }).length > 0) {
      if (!filterStatus.hasClass('filtered')) {
        filterStatus.addClass('filtered');
      }
    } else {
      if (filterStatus.hasClass('filtered')) {
        filterStatus.removeClass('filtered');
      }
    }

    filterStatusView.empty();
    filterData.forEach(function(filterName) {
      filterStatusView.append($(`<button>${filterName}</button>`));
    });

    handleSearchFilter();
  }

  const shopTemplate = $('#shop');
  let totalPage = parseInt($('#shopListTotalPage').val());
  let page = 1;
  let idle = true;
  function handleSearchFilter() {
    const searchWord = $('#search-word').val();
    const category = getFilter('category');
    const brand = getFilter('brand');
    const gender = getFilter('gender');
    const price = getFilter('price');
    const sort = $('.sort-list').find('button.active').attr('data-sort');
    
    const data = {
      searchWord,
      category,
      brand,
      gender,
      price,
      sort,
    };

    const queryString = [];
    if (data.searchWord !== '') {
      queryString.push(`searchWord=${searchWord}`);
    }
    if (data.category !== '') {
      queryString.push(`category=${category}`);
    }
    if (data.brand !== '') {
      queryString.push(`brand=${brand}`);
    }
    if (data.gender !== '') {
      queryString.push(`gender=${gender}`);
    }
    if (data.price !== '') {
      queryString.push(`price=${price}`);
    }
    if (data.sort > 1) {
      queryString.push(`sort=${sort}`);
    }

    if (queryString.length) {
      history.pushState(null, null, location.origin + location.pathname + '?' + queryString.join('&'));
    } else {
      history.pushState(null, null, location.origin + location.pathname);
    }

    $.ajax({
      method: 'POST',
      url: '/shop',
      data,
      dataType: 'json',
      success: (response) => {
        getShopList(response.shopList);

        totalPage = response.pagination.totalPage;
        page = response.pagination.page;
      },
      error: (reason) => {
        console.error(reason);
      },
    });
  }

  function handleLearnMore() {
    idle = false;

    const searchWord = $('#search-word').val();
    const category = getFilter('category');
    const brand = getFilter('brand');
    const gender = getFilter('gender');
    const price = getFilter('price');
    const sort = $('.sort-list').find('button.active').attr('data-sort');
    
    const data = {
      searchWord,
      category,
      brand,
      gender,
      price,
      sort,
      page: page + 1,
    };

    $.ajax({
      method: 'POST',
      url: '/shop',
      data,
      dataType: 'json',
      success: (response) => {
        moreShopList(response.shopList);

        totalPage = response.pagination.totalPage;
        page = response.pagination.page;

        idle = true;
      },
      error: (reason) => {
        console.error(reason);

        idle = true;
      },
    });
  }

  const shopList = $('.shop-list');
  function getShopList(shopListData) {
    shopList.empty();
    moreShopList(shopListData);
  }
  function moreShopList(shopListData) {
    shopListData.forEach((shop) => {
      let templateHTML = shopTemplate.html();
      
      for (let name in shop) {
        templateHTML = templateHTML.replace(new RegExp('{' + name + '}', 'g'), shop[name]);
      }
      
      const element = $(templateHTML);
      
      shopList.append(element);
    })
  }

  $(window).on('load resize scroll', function() {
    const windowScroll = $(window).scrollTop() + $(window).height();
    const shopListBottom = shopList.offset().top + shopList.height();

    if (page < totalPage) {
      if (shopListBottom < windowScroll) {
        if (idle) {
          handleLearnMore();
        }
      }
    }
  });

  function handleSearchWord() {
    const searchWord = $('#search-word').val();

    const data = {
      searchWord,
    };

    $.ajax({
      method: 'POST',
      url: '/shop/search',
      data,
      dataType: 'json',
      success: (response) => {
        getSearchShopList(response);
      },
      error: (reason) => {
        console.error(reason);
      },
    });
  }

  const searchTemplate = $('#searchBlock');
  const searchList = $('.shop-search-suggest > div');
  function getSearchShopList(searchListData) {
    searchList.empty();
    searchListData.forEach((searchBlock) => {
      let templateHTML = searchTemplate.html();
      
      for (let name in searchBlock) {
        templateHTML = templateHTML.replace(new RegExp('{' + name + '}', 'g'), searchBlock[name]);
      }
      
      const element = $(templateHTML);
      
      searchList.append(element);
    })
  }

  window.handleChangeFilter = handleChangeFilter;
  window.handleSearchFilter = handleSearchFilter;
  window.handleSearchWord = handleSearchWord;
});

// Search Word
$(function() {
  const search = $('.shop-search-box');
  const searchWord = $('#search-word');
  const searchSuggest = $('.shop-search-suggest');

  function searchInput() {
    if (delayId !== null) {
      clearTimeout(delayId);
    }

    if (searchWord.val() === '') {
      search.removeClass('searching');
    } else {
      search.addClass('searching');
    }

    delayId = setTimeout(function() {
      handleSearchWord();
      handleSearchFilter();
      delayId = null;
    }, 500);
  }

  let delayId = null;
  searchWord.on('input', searchInput);
  searchWord.on('focus', searchInput);

  searchSuggest.on('click', 'button', function() {
    const searchItem = $(this);
    const searchText = searchItem.find('.shop-suggest-text p:nth-child(1)').text();
    
    searchWord.val(searchText);

    searchInput();
  });

  $(document.documentElement).on('click', function(event) {
    let node = event.target;
    while (node && node.nodeType === Node.ELEMENT_NODE) {
      if (node === search[0]) {
        return;
      }
      node = node.parentNode;
    }

    search.removeClass('searching');
  });
});

// Filter Category
$(function() {
  const category = $('.shop-category-list');
  const categoryList = $('.shop-category-detail').find('.shop-category-items');

  category.on('input', 'input[name="filter"]', function() {
    const index = $(this).parents('.shop-category-item').index();

    categoryList.removeClass('active');
    categoryList.eq(index).addClass('active');
  });

  category.on('click', 'input[name="filter"]', function() {
    const item = $(this);
    const index = $(this).parents('.shop-category-item').index();

    if (categoryList.eq(index).hasClass('active')) {
      categoryList.removeClass('active');
      item.prop('checked', false);
    }
  });

  categoryList.on('click', 'button', function() {
    const searchWord = $('#search-word');
    const searchText = $(this).find('span').text();

    searchWord.val(searchText);

    handleSearchWord();
    handleSearchFilter();
  });
});

// Filter
$(function() {
  const filters = $('.filter');

  filters.on('click', '.btn-filter', function() {
    const filter = $(this).parent('.filter');

    filter.toggleClass('active');
  });
});

// Filter Items
$(function() {
  const filterStatus = $('.filter-status');
  const filterStatusView = $('.shop-filter-status');
  const filterClearButton = filterStatus.find('.btn-clear');

  const filterItems = $('.filter').find('input[type="checkbox"]');
  filterItems.on('input', function() {
    const filterCheckbox = $(this);
    const filterItem = filterCheckbox.parents('.filter-item').first();
    const filterSubList = filterItem.find('.filter-sub-list');

    if (filterSubList.length) {
      if (filterCheckbox.prop('checked')) {
        const filterSubCheckboxes = filterSubList.find('input[type="checkbox"]');
  
        filterSubCheckboxes.prop('checked', false);
      }
    } else if (!filterItem.parent().hasClass('filter-list')) {
      const filterParent = filterItem.parent();
      const filterSubCheckboxes = filterParent.find('input[type="checkbox"]');
      const filterParentItem = filterItem.parents('.filter-item');
      const filterParentCheckbox = filterParentItem.find('input[type="checkbox"]').first();

      if (filterCheckbox.prop('checked')) {
        if (filterParentCheckbox.prop('checked')) {
          filterParentCheckbox.prop('checked', false);
        } else if (filterSubCheckboxes.length === filterSubCheckboxes.filter(function() {
          return this.checked;
        }).length) {
          filterSubCheckboxes.prop('checked', false);
          filterParentCheckbox.prop('checked', true);
        }
      }
    }

    handleChangeFilter();
  });
  
  filterClearButton.on('click', function() {
    filterItems.prop('checked', false);

    handleChangeFilter();
  });

  filterStatusView.on('click', 'button', function() {
    const data = $(this).text().trim();
    const filterItem = filterItems.filter(function() {
      return $(this).val() === data;
    });

    filterItem.prop('checked', false);

    handleChangeFilter();
  });
});

// Sort
$(function() {
  const sortButton = $('.btn-sort');
  const sortList = $('.sort-list');

  sortButton.on('click', function() {
    sortButton.toggleClass('active');
  });
  
  sortList.on('click', 'button', function() {
    const sort = $(this);
    const sortName = sort.find('strong').text();

    sortList.find('button').removeClass('active');
    sort.addClass('active');

    sortButton.find('span').text(sortName);

    handleSearchFilter();
  });

  $(document.documentElement).on('click', function(event) {
    let node = event.target;
    while (node && node.nodeType === Node.ELEMENT_NODE) {
      if (node === sortButton[0]) {
        return;
      }
      node = node.parentNode;
    }

    sortButton.removeClass('active');
  });
});
