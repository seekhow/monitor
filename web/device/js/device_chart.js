/**
 * Created by Emma on 2017/5/17.
 */
// 基于准备好的dom，初始化echarts实例
/**
 * Created by a on 2017/5/17
 */
$(document).ready(function () {
    $.ajax({
        url:"chart_deviceServletAction",
        type:"GET",
        success:function (data){
         var obj=JSON.parse(data);
            //数据为空检测
            //alert(data);
           var aaData=obj.aaData;

            var length=aaData.length;
            if (length!= 0)
            {
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                var luCheng = new Array();
                var haoYou = new Array();
                var ciShu = new Array();
                for (var i =0;i<length;i++)
                {
                    luCheng[i] = parseInt(aaData[i].lucheng);
                    haoYou[i] = parseInt(aaData[i].haoyou);
                    ciShu[i] = parseInt(aaData[i].cishu);

                    //alert(luCheng[i]);
                }
// 指定图表的配置项和数据


                var option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            crossStyle: {
                                color: '#999'
                            }
                        }
                    },
                    toolbox: {
                        feature: {
                            dataView: {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    legend: {
                        data:['路程','耗油']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
                            axisPointer: {
                                type: 'shadow'
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '路程',
                            min: 0,
                            max: 10,
                            interval: 2,
                            axisLabel: {
                                formatter: '{value} km'
                            }
                        },
                        {
                            type: 'value',
                            name: '耗油',
                            min: 0,
                            max: 20,
                            interval: 4,
                            axisLabel: {
                                formatter: '{value} L'
                            }
                        }
                    ],
                    series: [
                        {
                            name:'路程',
                            type:'bar',
                            data:luCheng
                        },
                        {
                            name:'耗油',
                            type:'line',
                            yAxisIndex: 1,
                            data:haoYou
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }

            else {
                alert("数据为空");
                // 基于准备好的dom，初始化echarts实例
                myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据


                 option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            crossStyle: {
                                color: '#999'
                            }
                        }
                    },
                    toolbox: {
                        feature: {
                            dataView: {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    legend: {
                        data:['蒸发量','降水量','平均温度']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
                            axisPointer: {
                                type: 'shadow'
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '水量',
                            min: 0,
                            max: 250,
                            interval: 50,
                            axisLabel: {
                                formatter: '{value} ml'
                            }
                        },
                        {
                            type: 'value',
                            name: '温度',
                            min: 0,
                            max: 25,
                            interval: 5,
                            axisLabel: {
                                formatter: '{value} °C'
                            }
                        }
                    ],
                    series: [
                        {
                            name:'蒸发量',
                            type:'bar',
                            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                        },
                        {
                            name:'降水量',
                            type:'bar',
                            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                        },
                        {
                            name:'平均温度',
                            type:'line',
                            yAxisIndex: 1,
                            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }

        },
        error:function(){
            alert("未获取数据");
        }
    });

});