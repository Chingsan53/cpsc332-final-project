<!DOCTYPE html>
<html lang="en">
<title> Homepage </title>
<?php include('header.php'); ?>


<main style="min-height: calc(100vh - 176px - 104px); padding-bottom: 100px; overflow-x: hidden">

    <div class="flex justify-center mb-10 space-x-20 mt-10 text-center">
            <h5 class="text-gray-900 text-xl leading-tight font-medium mb-5">Select your profession:</h5>
        </div>

    <div class="flex justify-center mb-10 space-x-20 mt-10 text-center">
        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-sm">
            <h5 class="text-gray-900 text-xl leading-tight font-medium mb-5">Professor</h5>
            <img src="book.png" class="mx-auto w-32 mb-5" />
            <button type="button" onclick="window.location.href = './prof_selection.php'"
                class="inline-block px-6 py-2.5 bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out">Select</button>
        </div>

        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-sm">
            <h5 class="text-gray-900 text-xl leading-tight font-medium mb-5">Student</h5>
            <img src="student.png" class="mx-auto w-32 mb-5" />
            <button type="button" onclick="window.location.href = './student_selection.php'"
                class="inline-block px-6 py-2.5 bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out">Select</button>
        </div>
</div>



<?php include('footer.php'); ?>