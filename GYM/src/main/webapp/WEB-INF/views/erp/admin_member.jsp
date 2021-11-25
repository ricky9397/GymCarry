<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/gym/css/toast/tui-grid.css" type="text/css">
	<link
      rel="stylesheet"
      type="text/css"
      href="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.css"
     />
	<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">
</head>

<body >
	

	<div id="grid"></div>
	
</body>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="/gym/js/toast/tui-grid.js"></script>
	<script src="/gym/js/toast/tui-pagination.js"></script>
	<script src="/gym/js/toast/xhr-mock.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.min.js"></script>
	<script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>


<script>
    // polyfill for below IE11
    Object.setPrototypeOf =
      Object.setPrototypeOf ||
      function(obj, proto) {
        obj.__proto__ = proto;
        return obj;
    };
  </script>



<script type="text/javascript">
    XHRMock.setup();
    XHRMock.get('/api/readData?perPage=5&page=1', {
      status: 200,
      body: JSON.stringify({
        result: true,
        data: {
          //contents: gridData.slice(0, 5),
          pagination: {
            page: 1,
            totalCount: 20
          }
        }
      })
    })
      .get('/api/readData?perPage=5&page=2', {
        status: 200,
        body: JSON.stringify({
          result: true,
          data: {
            //contents: gridData.slice(5, 10),
            pagination: {
              page: 2,
              totalCount: 20
            }
          }
        })
      })
      .get('/api/readData?perPage=5&page=3', {
        status: 200,
        body: JSON.stringify({
          result: true,
          data: {
            //contents: gridData.slice(10, 15),
            pagination: {
              page: 3,
              totalCount: 20
            }
          }
        })
      })
      .get('/api/readData?perPage=5&page=4', {
        status: 200,
        body: JSON.stringify({
          result: true,
          data: {
            //contents: gridData.slice(15, 20),
            pagination: {
              page: 4,
              totalCount: 20
            }
          }
        })
      });
 </script>

<script>
const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: {
      api: {
        readData: { url: '/api/readData', method: 'GET' }
      }
    },
    scrollX: false,
    scrollY: false,
    minBodyHeight: 30,
    rowHeaders: ['rowNum'],
    pageOptions: {
      perPage: 5
    },
    columns: [
      {
        header: 'Name',
        name: 'name'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Type',
        name: 'type'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      }
    ]
  });
</script>


</html>


