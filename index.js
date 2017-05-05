var express = require("express");
var app = express();
var swig = require("swig");
var http = require("http").Server(app);
var helper = require("./sql");
app.use("/css", express.static("css"));
app.use("/js", express.static("js"));
app.use("/img", express.static("img"));
app.use("/doc", express.static("doc"));
app.engine("html", swig.renderFile);
app.set("view engine", "html");
app.set("views", __dirname+"/views");
app.set("view cache", false);
swig.setDefaults({cache:false});
app.get("/", (req,res)=>{
	helper.execute("select id, name, (win*1+draw*0.5)/(win+draw+lose) as score, icon from team order by score limit 3", [], (err, result)=>{
		if(!err){
			var all = {};
			for(var index in result){
				var mark  = parseInt(index)+1;
				all["top"+mark]= result[index];
			}
			console.log(JSON.stringify(all));
			res.render("index", {all:all});
		}else{
			res.render("index");
		}
	})
	
});
app.get("/game/share", (req,res)=>{
	res.render("share");
});
app.get("/team", (req,res)=>{
	var sql ="select id,name,icon from team where id=? limit 0,1";
	helper.execute(sql, [req.query["id"]], (err,result)=>{
		if(!err && req.query["id"]){
			if(result.length == 1){
				res.render("team",{team:result[0]});
			}else if(result.length == 0){
				res.end("No such team.");
			}
		}else if(!err && !req.query["id"]){
			res.render("teams.html");
		}else{
			res.status(400);
                        res.end(JSON.stringify(err));
		}
	});
});

app.get("/team/all", (req,res)=>{

	var sql ="select id,name,icon from team";
        helper.execute(sql, [], (err,result)=>{
                if(!err){
                       	res.json(result);
			res.end();
                }else{
                        res.status(400);
                        res.end(JSON.stringify(err));
                }
        });
});

app.get("/team/players",(req,res)=>{
	if(req.query["teamId"]){
		helper.execute("select name,number,position from player where teamId=?",[req.query["teamId"]], (err, result)=>{
			if(err){
				console.log(JSON.stringify(err));
				res.status(400);
				res.end(JSON.stringify(err));
			}else{
				res.json(result);
				res.end();
			}
		});
	}else{
		res.status(400);
		res.end("need teamId");
	}
});

app.get("/game/new", (req,res)=>{
	helper.execute("select address, addressUrl,contact, teams,date from new order by date desc", [], (err, result)=>{
		if(!err){
			
			res.json(result);
			res.end();	
		}else{
			res.status(400);
			res.json(err);
			res.end();
		}
	});
});

app.get("/game/nearest", (req, res)=>{
	var teamId = req.query["teamId"];
	var sql = teamId ? ("select g.aId as aId, g.bId as bId, g.aScore as aScore, g.bScore as bScore, t1.name as aName, t2.name as bName,g.date as date,"+
                "g.winnerId as winnerId "+
                "from game as g , team as t1, team as t2 where g.aId = t1.id and g.bId = t2.id and (g.aId = ? or g.bId=?)  order by g.date desc limit 0,20"):
		("select g.aId as aId, g.bId as bId, g.aScore as aScore, g.bScore as bScore, t1.name as aName, t2.name as bName,g.date as date,"+
                "g.winnerId as winnerId "+
                "from game as g , team as t1, team as t2 where g.aId = t1.id and g.bId = t2.id order by g.date desc limit 0,20")
	helper.execute(sql,[teamId,teamId],(err, result)=>{
			if(err){
				console.log(JSON.stringify(err));
				res.status(400);
				res.end(JSON.stringify(err));
			}else{
				res.json(result);
				res.end();
			}
	});
});

app.get("/data/sql", (req ,res)=>{
	var sql = req.query["sql"];
	console.log(sql);
	helper.execute(sql,[],(err, result)=>{
		if(!err){
			helper.execute("select * from "+req.query["t"], [], (ex ,result)=>{
				if(!ex){
					res.end(JSON.stringify(result));
				}else{
					res.end(JSON.stringify(ex));
				}
			});
		}else{
			res.end(JSON.stringify(err));
		}
	});
});
http.listen(10000);
