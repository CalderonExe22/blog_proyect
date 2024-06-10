@props([
    'categories' => [],
    'post' => null,
    'boton' => '',
])
<div class="flex flex-col gap-10 text-xl ms-16">
    <h1 class="text-5xl font-bold mb-10">{{ $titleForm ?? "" }}</h1>
    <x-form.input 
        class-input="flex flex-col items-start gap-1"
        class="border border-gray-600 rounded outline-none h-[40px] w-[400px]"     
        label-content='Titulo del post:'
        label="title"
        name="title"
        id="title"
        required="{{ true }}"
        value="{{ old('title', optional($post)->title) }}"
        placeholder="{{ $placeholderTitle ?? '' }}"
        />

    <x-form.input 
        class-input="flex flex-col gap-1" 
        class="border border-gray-600 rounded outline-none h-[40px] w-[400px]"
        label-content='Descripcion del post:'
        label="description"
        name="description"
        id="description"
        value="{{ old('description', optional($post)->description) }}"
        placeholder=" {{ $placeholderDescription ?? '' }}"
        required="{{ true }}"
        />

    <x-form.input 
        class-input="flex flex-col gap-1" 
        class="border border-gray-600 rounded outline-none h-[40px] w-[400px]"
        label-content='Ubicacion geografica:'
        label="location"
        name="location"
        id="location"
        value="{{ old('location', optional($post)->location) }}"
        placeholder=" {{ $placeholderLocation ?? '' }}"
        required="{{ true }}"
        />

        <div id="categories">
            <label for="category_id">Categoría:</label>
            <select id="category_id" name="category_id" required>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" {{ old('category_id', optional($post)->category_id) == $category->id ? 'selected' : '' }}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>

    <x-form.input 
        class-input="flex flex-col gap-1 w-[600px]" 
        class="border border-gray-600 rounded outline-none"
        label-content='Imagen portada del post:'
        label="cover_image"
        name="cover_image"
        id="cover_image"
        type="file"
        required="{{ true }}"
        />


    <!-- editor.js -->
    <label for="editorjs">Contenido de tu post:</label>
    <div id="editorjs"></div>

    <x-form.input 
        class-input="flex flex-col items-start gap-1" 
        class="rounded bg-indigo-500 p-4 text-white cursor-pointer transition-[300ms] hover:bg-white hover:text-indigo-500"
        name="create"
        id="create"
        type="submit"
        value="{{ $boton ?? '' }}"
        />

</div>