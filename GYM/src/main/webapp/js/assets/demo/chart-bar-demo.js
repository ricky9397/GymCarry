// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example

var myBarChart;
function getBar(total, month){
	if(window.myBarChart != undefined){
		window.myBarChart.destroy();
	} 

	var ctx = document.getElementById("myBarChart");
	window.myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: month,
	    datasets: [{
	      label: "Revenue",
	      backgroundColor: [
	      		'rgba(255, 99, 132, 0.5)', 
	      		'rgba(54, 162, 235, 0.5)', 
	      		'rgba(255, 206, 86, 0.5)', 
	      		'rgba(75, 192, 192, 0.5)', 
	      		'rgba(153, 102, 255, 0.5)', 
	      		'rgba(255, 159, 64, 0.5)',
	      		'#FF9DFF',
	      		'#FF8C8C',
	      		'#CBFF75',
	      		'#FFD700',
	      		'#0064CD',
	      		'#9400D3'

	      ],
	      borderColor: "rgba(2,117,216,1)",
	      data: total,
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 12
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 20000000,
	          maxTicksLimit: 5
	        },
	        gridLines: {
	          display: true
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});
};
