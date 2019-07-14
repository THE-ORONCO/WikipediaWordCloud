//set up drawingspace and initialize different variables that are needed later
//visual elements and variables
var svg = d3.select("#drawingSpace"),
    width = +svg.attr("width"),
    height = +svg.attr("height"),
    chartWidth,
    chartHeight,
    margin,
    color = d3.scaleOrdinal(d3.schemeCategory10), //color sheme for the nodes
    chartLayer = svg.append("g").classed("chartLayer", true);//set up variable drawing layer
setSize(); //initialize the graphical base components

//data access and data containers
var path = "./testData/json/",  //path of the database
    data = {},//initialize the data object
    nodeData = [],//all Data on Nodes
    linkData = [],//all Data on Links
    renderedNodes = [],//all rendered Nodes
    renderedLinks = [];//all rendered Links


//simulation environment
var simulation = d3.forceSimulation(renderedNodes)                   //defining what forces act on the different elements
// .force('charge', d3.forceManyBody())
    .force('charge', d3.forceManyBody().strength(-500))
    // .force('link', d3.forceLink())
    .force("link", d3.forceLink().id(function (d) {
        return d.id;
    }).strength(0.5).distance(150))
    .force("collide", d3.forceCollide(function (d) {
        return 40
    }).iterations(3))
    .force('center', d3.forceCenter(width / 2, height / 2))
    .alphaTarget(1)
    .on("tick", ticked)
    .stop();


//create the graph depending on the size of the svg element
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


initialize("BossuetTo");

//initialisation function
function initialize(name) {
    data = loadData(path, name); //initial load,

    addNode(data.node);
    data.links.forEach(function (d) {
        addNode({"id": d.target});

        addLink({
            "source": data.node,
            "target": renderedNodes.find(x => x.id === d.target)
        });
    });
}


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

//initial render/simulation of the graph
restart();

//rendering function that starts and restarts the rendering process based on the data in renderedNodes and renderedLinks
function restart() {

    // Apply the general update pattern to the renderedNodes
    //assign node data to nodes
    node = node.data(renderedNodes, function (d) {
        return d.id;
    });

    //remove all nodes without data
    node.exit()
        .transition()//shrink the circles to r = 0
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
            node.transition().attr("r", 20);//let the circles pop into the diagram
        })
        .on("click", doClickAction);

    //ad labels to all the new nodes
    labels = temp.append("text")
        .text(function (d) {
            return d.id;
        })
        .attr("x", function (d) {
            return d.id.toString().length * (-1) * 5; //center the text somewhat
        })
        .attr("y", 17)
        .call(function (text) {
            text.transition().attr("opacity", 100); //let the text become more opaque
        });

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
    link = link.data(renderedLinks, function (d) {
        return d.source + "-" + d.target;
    });

    //remove all links without data
    link.exit()
        .transition()//animate the removal of the link
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
    simulation.nodes(renderedNodes);
    simulation.force("link").links(renderedLinks);
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

//decides what action is activated when the user clicks a node
function doClickAction(d) {
    if (document.getElementById("expandCheck").checked) {
        if (document.getElementById("from").checked) {
            clickExpandFrom(d);
        }
        if (document.getElementById("to").checked) {
            clickExpandTo(d);
        }

    }
    if (document.getElementById("collapseCheck").checked) {
        clickCollapse(d);

    }
    if (document.getElementById("deleteCheck").checked) {
        clickRemove(d);

    }
    if (document.getElementById("selectCheck").checked) {
        clickSelect(d);
    }

    console.log(renderedNodes);
    console.log(renderedLinks);
    console.log(nodeData);
    console.log(linkData);

    validateDataSets();
}

function clickExpandFrom(d) {
    data = loadData(path, d.id + "From");

    data.links.forEach(function (b) {
        addNode({"id": b.target, "x": width / 2, "y": height / 2});

        addLink({
            "source": renderedNodes.find(x => x.id === d.id),
            "target": renderedNodes.find(x => x.id === b.target)
        });
    });

    restart();
}

function clickExpandTo(d) {
    data = loadData(path, d.id + "To");

    data.links.forEach(function (b) {
        addNode({"id": b.source, "x": width / 2, "y": height / 2});

        addLink({
            "source": renderedNodes.find(x => x.id === b.source),
            "target": renderedNodes.find(x => x.id === d.id)
        });
    });

    restart();
}


function clickCollapse(d) {

}

function clickSelect(d) {

}

function clickRemove(d) {

    for (var i = renderedLinks.length - 1; i > -1; i--) {
        if ((renderedLinks[i].source === d) || (renderedLinks[i].target === d)) {
            renderedLinks.splice(i, 1);
        }
        console.log("Link: " + renderedLinks[i].source.id + " to " + renderedLinks[i].target.id);
    }
    for (i = 0; i < renderedNodes.length; i++) {
        if (renderedNodes[i] === d) {
            renderedNodes.splice(i, 1);
        }
    }
    restart();
}


//add a node
function addNode(newNode) {
    if (!nodeData.find(n => n.id === newNode.id)) { //the node doesn't exist in node
        nodeData.push(newNode);
        renderedNodes.push(newNode);
    }
}

//add a link
function addLink(newLink) {
    if ((linkData.find(n => (n.source === newLink.source && n.target === newLink.target)) === undefined) //link doesn't exist in linkDara
        && !(newLink.source === newLink.target))                        //link doesn't has the same node as his source and his target
    //link has source and target <-- still needs to be added
    {
        linkData.push(newLink);
        renderedLinks.push(newLink);
    }
}

//transforms links with references to the nodes by id to references to the nodes by object reference
function convertLinkData() {
    linksRefference.forEach(function (d) {
        linkData.push({
            "source": renderedNodes.find(x => x.id === d.source),
            "target": renderedNodes.find(x => x.id === d.target)
        });
    });
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
        }
    );
    return json;
}
validateDataSets();

function validateDataSets() {
    console.log("validation results:");
    if(nodeData.length === 0){
        console.log("nodeData is empty");
    }
    else if (nodeData.find(x => nodeData.find(y => y.id === x.id)).length > 1) {
        console.log("duplicate in nodeData");
    }

    if(renderedNodes.length === 0){
        console.log("renderedNodes is empty");
    }
    else if (renderedNodes.find(x => renderedNodes.find(y => y.id === x.id)).length > 1) {
        console.log("duplicate in renderedNodes");
    }

    if(linkData.length === 0){
        console.log("linkData is empty");
    }
    else if (linkData.find(x => linkData.find(y => y.source === x.source && y.target === x.target)).length > 1) {
        console.log("duplicate in linkData");
    }

    if(renderedLinks.length === 0){
        console.log("renderedLinks is empty");
    }
    else if (renderedLinks.find(x => renderedLinks.find(y => y.source === x.source && y.target === x.target)).length > 1) {
        console.log("duplicate in renderedLinks");
    }
}

function renderAllData() {

    //!!!!!!!!!!!!!!! WARNING THIS IS WORKS VIA REFFERENCE AND HAT TO BE PUT INTO A FOR LOOP!!!!!!!!!!
    renderedLinks = linkData;
    renderedNodes = nodeData;
    restart();
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
