<!DOCTYPE html>
<html lang="en">
<title> Professor Grade Details </title>
<?php include('subpages_header.php'); ?>

<main style="min-height: calc(100vh - 176px - 104px);">
    <h1 class="font-semibold leading-tight text-5xl mt-0 mb-2 text-grey-600 bold text-center mt-10">Professor Page</h1>

    <div class="flex items-center justify-center mb-10 scale-125">
        <div class="border-2 border-black bg-slate-900 basis-3/12 text-white rounded-lg mt-10 px-10 py-3">
            <p>Grade details lookup</p>
        </div>
    </div>

    <form method="post">
        <div class="flex justify-center scale-110 mb-10">
            <div class="mb-3 xl:w-50">
                <label for="exampleFormControlInput1" class="form-label inline-block mb-2 text-gray-700">Enter a course number:</label>
                <input type="number" id="course_num" name="course_num" class="
                form-control
                block
                w-full
                px-3
                py-1.5
                text-base
                font-normal
                text-gray-700
                bg-white bg-clip-padding
                border border-solid border-gray-300
                rounded
                transition
                ease-in-out
                m-0
                focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none
              "  />
            </div>
            <div style="width: 5%; float:left"></div>
            <div class="mb-3 xl:w-50">
                <label for="exampleFormControlInput2" class="form-label inline-block mb-2 text-gray-700">Enter a section number:</label>
                <input type="number" id="section_num" name="section_num" class="
                form-control
                block
                w-full
                px-3
                py-1.5
                text-base
                font-normal
                text-gray-700
                bg-white bg-clip-padding
                border border-solid border-gray-300
                rounded
                transition
                ease-in-out
                m-0
                focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none
              "  />
            </div>
        </div>

        <div class="flex space-x-2 justify-center">
            <input type="submit" value="Submit" name="submitbutton"
                class="button inline-block px-10 py-2.5 mb-10 bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out">
        </div>

    </form>

    <div class="flex space-x-2 justify-center scale-110 mb-10">
        <style>
        table, td, th {
            border: 1px solid black;
            width: 700px;
        }
        </style>
            <?php
            if(isset($_POST['submitbutton'])) {
                getProfInfoFromSsn($_POST['course_num'], $_POST['section_num']);
            }
                function getProfInfoFromSsn($c_num, $s_num) {
                    $mysqli = new mysqli("mariadb","cs332u30","QBtqH95T","cs332u30");

                    if ($mysqli -> connect_errno) {
                    echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
                    exit();
                    }

                    $query = "SELECT grade, COUNT(*) AS c FROM ENROLLMENT INNER JOIN SECTION ON ENROLLMENT.section_number = SECTION.section_number WHERE SECTION.course_number = $c_num AND SECTION.section_number = $s_num GROUP BY grade"; //You don't need a ; like you do in SQL
                    $result = $mysqli -> query($query);


                    if (!$result || mysqli_num_rows($result)==0) {
                        echo "<td style=\"text-align:center\"><strong>No data found</strong></td>";
                    } else {

                        echo "<div  class=\"flex space-x-2 justify-center width: 200";
                            echo "<div class=\"border-2 border-black bg-slate-900 basis-3/12 text-white rounded-lg mt-10 px-10 py-3\">";
                                echo "<p>Result(s) for section $s_num in course number $c_num </p>";
                            echo "</div>";
                        echo "</div>";
                        
                        echo "<div class=\"flex space-x-2 justify-center scale-110 mb-10\">";
                        echo "<table>"; // start a table tag in the HTML
                        echo "<div style=\"text-align:center\">";
                        echo "<tr>
                        <td style=\"text-align:center\"><strong>Grade</strong></td>
                        <td style=\"text-align:center\"><strong>Number of students</strong></td>
                        
                        </tr>";

                        while($row = $result -> fetch_assoc()){   //Creates a loop to loop through results
                        echo "<tr><td style=\"text-align:center\">" . htmlspecialchars($row['grade']) . "<td style=\"text-align:center\">" . htmlspecialchars($row['c']) . "</td>";  //$row['index'] the index here is a field name
                        }

                        echo "</div>";
                        echo "</table>";
                        echo "</div";
                    }

                    // Free result set
                    $result -> free_result();
                    $mysqli -> close();
                }
            ?>
        </div>

</main>

<?php include('footer.php'); ?>
</html>
