//set up drawingspace and initialize different variables that are needed later
var svg = d3.select("#graphContainer").append("svg").attr("id", "drawingSpace"),
    width = +svg.attr("width"),
    height = +svg.attr("height"),
    chartWidth,
    chartHeight,
    margin,
    color = d3.scaleOrdinal(d3.schemeCategory10),

    path = "../Graph Progress/testData/BillGates.json";

//set up variable drawing layer
var chartLayer = svg.append("g").classed("chartLayer", true);

setSize();

function setSize() {
    width = document.querySelector("#graphContainer").clientWidth;
    height = document.querySelector("#graphContainer").clientHeight;

    margin = {top: 0, left: 0, bottom: 0, right: 0};


    chartWidth = width - (margin.left + margin.right);
    chartHeight = height - (margin.top + margin.bottom);

    svg.attr("width", width).attr("height", height);


    chartLayer
        .attr("width", chartWidth)
        .attr("height", chartHeight)
        .attr("transform", "translate(" + [margin.left, margin.top] + ")")


}

//loading test data via jquery until the xml request to json converter thingy is finished
var data = (function () {
    var json = null;
    $.ajax({
        'async': false,
        'global': false,
        'url': path,
        'dataType': "json",
        'success': function (data) {
            json = data;
        }
    });
    return json;
})();

var THEBILL = {"id": data.wiki.pageName, "group": 5, "pageViews": data.wiki.pageViews};

var nodeData = [{"id": data.wiki.pageName, "group": 5, "pageViews": data.wiki.pageViews}],

    THEBILLandFriends = generateMissingNodes(),


    linksJson = data.wiki.linkTos.linkTo;


function generateMissingNodes() {

    var temp = [THEBILL];

    for (var i = 0; i < data.wiki.linkTos.linkTo.length; i++) {
        temp.push({"id": data.wiki.linkTos.linkTo[i].target, "group": 6, "pageViews": 300});
    }


    return temp;


}


function generateLinks() {
    var temp = [];
    for (var i = 0; i < data.wiki.linkTos.linkTo.length; i++) {
        temp.push({"source": nodeData[0], "target":  nodeData.find(x => x.id === data.wiki.linkTos.linkTo[i].target)});
    }

    return temp;
}




var linkData = [],
    linksToTheBill = generateLinks();




//transforms links with references to the nodes by id to references to the nodes by object reference
/*function convertLinkData() {
    linksRefference.forEach(function (d) {
        renderedLinks.push({
            "source": renderedNodes.find(x => x.id === d.source),
            "target": renderedNodes.find(x => x.id === d.target)
        });
    });
}

convertLinkData();*/

var id = 0;

//defining what forces act on the different elements
var simulation = d3.forceSimulation(nodeData)
    .force('charge', d3.forceManyBody().strength(-200))
    .force('link', d3.forceLink().distance(300).strength(0.1))
    .force('center', d3.forceCenter(width / 2, height / 2))
    .alphaTarget(1)
    .on("tick", ticked)
    .stop();

//initializing the graph
var g = svg.append("g").attr("class", "graph"),
    link = g.append("g").attr("class", "links").selectAll(".link"),
    node = g.append("g").attr("class", "nodes").selectAll(".node");

//adding zooming capabilities to the svg element
var zoom_handler = d3.zoom().on("zoom", zoom_actions);
zoom_handler(svg);

function zoom_actions() {
    g.attr("transform", d3.event.transform);
}

//rendering function
restart();

function restart() {

    // Apply the general update pattern to the renderedNodes
    //assign node data to nodes
    node = node.data(nodeData, function (d) {
        return d.id;
    });

    //remove all nodes without data
    node.exit()
        .transition()
        .attr("r", 0)
        .remove();

    //temporarily save nodes that are not rendered yet into "temp"
    var temp = node.enter().append("g").attr("class", "node");

    //add circles to all the new nodes
    circle = temp.append("circle")
        .attr("fill", function (d) {
            return color(d.group);
        })
        .call(function (node) {
            node.transition().attr("r", 8);
        })
        .on("click", click);

    //ad labels to all the new nodes
    labels = temp.append("text")
        .text(function (d) {
            return d.id;
        })
        .attr("x", function (d) {
            return d.id.toString().length * (-1) * 5;
        })
        .attr("y", 17);

    //merge all the new nodes that now have circles and labels back into the set of all nodes
    node = node.merge(temp);

    //adding dragging capabilities to the nodes
    var drag_handler = d3.drag()
        .on("start", dragstarted)
        .on("drag", dragged)
        .on("end", dragended);

    drag_handler(node);


    // Apply the general update pattern to the renderedLinks
    //assign link data to nodes
    link = link.data(linkData, function (d) {
        return d.source + "-" + d.target;
    });

    //remove all links without data
    link.exit()
        .transition()
        .attr("stroke-opacity", 0)
        .attrTween("x1", function (d) {
            return function () {
                return d.source.x;
            };
        })
        .attrTween("x2", function (d) {
            return function () {
                return d.target.x;
            };
        })
        .attrTween("y1", function (d) {
            return function () {
                return d.source.y;
            };
        })
        .attrTween("y2", function (d) {
            return function () {
                return d.target.y;
            };
        })
        .remove();

    //add all links that dont exist in the svg element
    link = link.enter().append("line")
        .call(function (link) {
            link.transition().attr("stroke-opacity", 1);
        })
        .merge(link)
        .attr("class", "link");

    // Update and restart the simulation.
    simulation.nodes(nodeData);
    simulation.force("link").links(linkData);
    simulation.alpha(1).restart();
}

//define what happens on a tick of the simulation
function ticked() {
    link
        .attr("x1", function (d) {
            return d.source.x;
        })
        .attr("y1", function (d) {
            return d.source.y;
        })
        .attr("x2", function (d) {
            return d.target.x;
        })
        .attr("y2", function (d) {
            return d.target.y;
        });

    node
        .attr("transform", function (d) {
            return "translate(" + d.x + "," + d.y + ")";
        })


}

var clicked = false;

function click() {

    if (!clicked) {
        nodeData = THEBILLandFriends;
        linkData = generateLinks();
        console.log(nodeData);
        console.log(linkData);

        restart()

    } else {
        nodeData = [THEBILL];
        linkData = [];
        console.log(nodeData);
        console.log(linkData);
        restart()
    }
    clicked = !clicked;
}



//add a node
function addNode(newNode) {
    if (!node.find(n => n.id === newNode.id)) { //the node doesn't exist in node
        node.push(newNode);
    }
    restart();
}

//add a link
function addLink(newLink) {
    if (!(link.find(n => (n.source === newLink.source && n.target === newLink.target)) === undefined) //link doesn't exist in link
        && !(newLink.source === newLink.target)                                                       //link doesn't has the same node as his source and his target
        && !(node.find(n => (n.id === newLink.source)) === undefined)                                 //link has a source in node
        && !(node.find(n => (n.id === newLink.target)) === undefined)) {                              //link has a target in node

        node.push(newLink);
    }
    restart();
}

//function for loading data | currently with local json
function loadData(path, name) {
    var json = null;
    $.ajax({
        'async': false,
        'global': false,
        'url': path + name + ".json",
        'dataType': "json",
        'success': function (data) {
            json = data;
        }
    });
    return json;
}


//define what happens on different stages of dragging
function dragstarted(d) {
    if (!d3.event.active) simulation.alphaTarget(0.3).restart();
    d.fx = d.x;
    d.fy = d.y;
}

function dragged(d) {
    d.fx = d3.event.x;
    d.fy = d3.event.y;
}

function dragended(d) {
    if (!d3.event.active) simulation.alphaTarget(0);
    d.fx = null;
    d.fy = null;
}
