<!DOCTYPE html>
<html lang="en">
<title> Student Homepage </title>
<?php include('header.php'); ?>


<main style="min-height: calc(100vh - 176px - 104px);">
    <!-- Background image
    <div class="relative overflow-hidden bg-no-repeat bg-cover" style="
        background-position: 50%;
        background-image: url('csuf.jpeg');
        height: 350px;
      ">
        <div class="absolute top-0 right-0 bottom-0 left-0 w-full h-full overflow-hidden bg-fixed"
            style="background-color: rgba(0, 0, 0, 0.5)">
            <div class="flex justify-center items-center h-full">
                <div class="text-center text-white px-6 md:px-12 w-7/12">
                    <h1 class="text-5xl font-bold mt-0 mb-6">California State University, Fullerton</h1>
                    <h3 class="text-3xl font-semibold mb-8">IT TAKES A TITAN</h3>
                    <h2 class="text-3xl font-semibold mb-8">THE CAMPAIGN FOR CAL STATE FULLERTON</h2>

                    <button type="button"
                        class="inline-block px-6 py-2.5 text-white bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out"
                        data-mdb-ripple="true" data-mdb-ripple-color="light">
                        Get started
                    </button>
                </div>
            </div>
        </div>
    </div> -->

    <div class="flex justify-center mb-10 space-x-20 mt-10 text-center">
            <h5 class="text-gray-900 text-xl leading-tight font-medium mb-10">Student Homepage</h5>
        </div>

    <div class="flex justify-center mb-10 space-x-20 mt-10 text-center">
        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-sm">
            <h5 class="text-gray-900 text-xl leading-tight font-medium mb-5">Schedule lookup</h5>
            <img src="student.png" class="mx-auto w-32 mb-5" />
            <button type="button" onclick="window.location.href = './student_schedule.php'"
                class="inline-block px-6 py-2.5 bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out">Select</button>
        </div>

        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-sm">
            <h5 class="text-gray-900 text-xl leading-tight font-medium mb-5">Courses lookup</h5>
            <img src="student.png" class="mx-auto w-32 mb-5" />
            <button type="button" onclick="window.location.href = './student_course.php'"
                class="inline-block px-6 py-2.5 bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out">Select</button>
        </div>
</div>



<?php include('footer.php'); ?>