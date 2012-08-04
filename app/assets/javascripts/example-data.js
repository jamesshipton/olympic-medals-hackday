Ext.require(['Ext.data.*']);

Ext.onReady(function() {

    window.generateData = function(n, floor){
        var data = [],i;
        
		var countries = ['Great Britain', 'United States', 'Germany', 'Austria', 'France', 'Spain', 'Russia'];
    
        floor = (!floor && floor !== 0)? 20 : floor;
        
        for (i = 0; i < countries.length; i++) {
            data.push({
                name: countries[i],
                data1: Math.floor(Math.max((Math.random() * 100), floor))
               
            });
        }
        console.log(data);
		return data;
    };	

    window.store1 = Ext.create('Ext.data.JsonStore', {
        fields: ['name', 'data1'],
        data: generateData()
    });
      
});
