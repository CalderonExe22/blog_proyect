@props([
    'id'    => 'input',
    'label' => 'Input',
    'type'  => 'text',
    'name'  => 'input',
    'placeholder'  => '',
    'value'  => '',
    'required'  => false,
    'readonly'  => false,
])
<div class="{{ $classInput }}">
    
    <label for="{{ $label }}">{{ $labelContent ?? ''  }}</label>

    <input 
        type="{{ $type }}"
        id="{{ $id }}"
        name="{{ $name }}"
        value="{{ $value }}"
        placeholder="{{ $placeholder }}"
        @required( $required )
        @readonly( $readonly ) >

    @error($name)
        <span class="text-red-700 text-xs">{{ $messege }}</span>
    @enderror
    
</div>