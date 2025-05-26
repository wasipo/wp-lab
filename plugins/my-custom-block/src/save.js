import { useBlockProps } from '@wordpress/block-editor';
import './style.scss';

export default function save() {
    return (
        <p {...useBlockProps.save()}>My Custom Block – hello from the saved content!</p>
    );
}
