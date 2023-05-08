<!DOCTYPE html>
<html lang="en">
<?php include('header.php'); ?>

<main style="min-height: calc(100vh - 176px - 104px);">
    <h1 class="font-semibold leading-tight text-5xl mt-0 mb-2 text-grey-600 bold text-center mt-10">Professors</h1>

    <div class="flex items-center justify-center mb-10 scale-125">
        <div class="border-2 border-black bg-slate-900 basis-3/12 text-white rounded-lg mt-10 px-10 py-3">
            <p>Search Professors:</p>
        </div>
    </div>

    <form action="medical-records.php" method="post">
        <div class="flex justify-center scale-110 mb-10">
            <div class="mb-3 xl:w-96">
                <label for="exampleFormControlInput1" class="form-label inline-block mb-2 text-gray-700">SSN:</label>
                <input type="text" class="
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
              " name="ssn" placeholder="" />
            </div>
        </div>

        <div class="flex space-x-2 justify-center">
            <input type="submit" name="submit" value="submit"
                class="inline-block px-10 py-2.5 mb-10 bg-slate-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-gray-700 hover:shadow-lg focus:bg-gray-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-gray-800 active:shadow-lg transition duration-150 ease-in-out">
        </div>
    </form>


</main>

<?php include('footer.php'); ?>
</html>
