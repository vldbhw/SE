var express = require('express');
var router = express.Router();
var config = require('../../config/config.json');
var mysql = require("mysql");
var flash = require('connect-flash')
var connection = mysql.createConnection(config.default.db);


router.get('/', function (req, res, next) {
    var sid = req.flash('sid');
    var pro = req.flash('pro');

    req.flash('sid', sid);
    req.flash('pro', pro);
    connection.query('Select * from project_content where project_id = ? AND flag = 1', ["test"], function (error, result) {
        var title = result;
      
        connection.query('Select * from project_content where project_id = ? AND flag = 0 ORDER BY column', ["test"], function (error, result) {
            var card = result;

            connection.query('Select * from project_log where project_id = ? ORDER BY date', ["test"], function (error, result) {
            var history = result;

                res.render('schedule/index.swig', { sid: sid, pro: pro, flag:"schedule", 
                    titles : title,
                    cards : card,
                    historys : history
                });
            });
      
        });   
    });
    
    
});

router.post('/', function (req, res, next) {
    var sid = req.flash('sid');
    var pro = req.flash('pro');

    req.flash('sid', sid);
    req.flash('pro', pro);
    connection.query('Select * from project_content where (project_id = ? AND flag = 1) order by seq', [pro], function (error, result1) {
        var title = result1;
        
        connection.query('Select * from project_content where (project_id = ? AND flag = 0) order by seq', [pro], function (error, result2) {
            var card = result2;
            res.send({
                sid: sid, pro: pro, 
                titles: title,
                cards: card}
                   
               
            );

        });
    });


});

router.post('/add_card', function (req, res) {
    var seq;
    var pro = req.flash('pro');
    req.flash('pro', pro);
  

    connection.query('Select * from project_content ORDER BY seq', function (error, result) {
        if (result.length == 0) seq = 0;
        else seq = result[result.length - 1].seq + 1;
        if (req.body.flag == 0) {
            connection.query('insert into project_content values (?,?,?,?,?,?,?,?,?) ', [seq, pro, req.body.col, '', '', '', req.body.title, req.body.content, 0], function (error, result) {
               
                res.send('����');
            });
        }
        else if (req.body.flag == 1) {
            connection.query('insert into project_content values (?,?,?,?,?,?,?,?,?) ', [seq, pro, req.body.col, '', '', '', req.body.title, req.body.content, 1], function (error, result) {
                

                res.send('����');
            });
        }


    });
});
   


router.post('/modify_card', function (req, res) {
    var date = new Date();
    connection.query('Select * from project_content', function (error, result) {
        connection.query('UPDATE project_content SET column = ?, row = ?, start_date = ?, end_date = ?, title = ?, content = ? WHERE project_id = ? AND column = ? AND row = ?', [req.body.new_column, req.body.new_row, req.body.new_start_date, req.body.new_end_date, req.body.new_title, req.body.new_content, session.flash('pro'), req.body.original_column, req.body.original_row], function (error, result) {
        });
    });
});

router.post('/remove_card', function (req, res) {
    connection.query('delete from project_content where project_id = ? AND column = ? AND row = ?', [session.flash('pro'), req.body.column, req.body.row], function (error, result) {    
    });
});

router.post('/add_log', function (req, res) {
    var seq;
    var date = new Date();
    connection.query('Select * from project_log', function (error, result) {
        if(result.length == 0) seq = 0;
    	else	seq = result[result.length-1].seq + 1;

        connection.query('insert into project_log values (?,?,?,?)', [seq, session.flash('pro'), date, log], function (error, result) {
        });
    });
});

router.post('/getSeq',function(req,res){
   var seq
   connection.query('Select * from project_content ORDER BY seq', function (error, result) {
        if(result.length == 0) seq = 0;
        else	seq = result[result.length-1].seq + 1;
        seq = 'card'+seq;
        res.send(seq);
    });

});

router.post('/update', function (req, res) {
    
    connection.query('update project_content set col = ?, content = ? where seq = ?',[req.body.col,req.body.content,req.body.seq], function (error, result) {
        console.log(error);
        res.send();
    });

});

module.exports = router;