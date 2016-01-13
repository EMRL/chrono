// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function checkOverDue()
{
    var tasks = document.getElementsByClassName("task");
    var overdue_tasks = document.getElementsByClassName("overdue");
    var prefix = "task_";
    if(document.getElementById("overdue_only").checked){
        
        var overduesList = getOverDuesList(overdue_tasks);
        var idList = getID(tasks);
        var k = 0;
        
        for(i=0; i < idList.length; i++)
        {
            if(idList[i] == overduesList[k])
            {
                k++;
            }
            else
            {
                target = prefix + idList[i];                
                elem = document.getElementById(target);
                addClass(elem," hide");
            }
        }
    }
    else{
        for(i=0;i<tasks.length;i++)
        {
            removeClass(tasks[i]," hide");
        }
    }

}

function getOverDuesList(overdue)
{
    var overdues=[]; 
    var post_id;
    for(i=0; i < overdue.length; i++)
    {
        post_id = overdue[i].className.split(" ");
        overdues.push(post_id[1]);
    }
    return overdues.sort();
}

function getID(tasks)
{
    var ids = [];
    var id;
    for(i=0;i<tasks.length; i++){
        id = tasks[i].id.split("_");
        ids.push(id[1]);
    }
    return ids.sort();
}





function addClass(element,name)
{
    element.className += name;
    
}

function removeClass(element,name)
{
    element.className = element.className.replace(name,'');        
}

function addClassInRange(element,name,start,end){
    var max = element.length;
    for(i=start;i<max && i <= end;i++)
    {
        element[i].className += name;
    }
}

function removeClassInRange(element,name,start,end){
    var max = element.length;
    for(i=start;i<max && i<= end; i++){
        element[i].className = element[i].className.replace(name,''); 
    }
}
