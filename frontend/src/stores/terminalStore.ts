import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface TerminalTab {
  id: string;
  name: string;
  sessionId: string;
}

export const useTerminalStore = defineStore('terminal', () => {
  const terminals = ref<TerminalTab[]>([]);
  const activeIndex = ref(0);

  function addTerminal(tab: TerminalTab) {
    terminals.value.push(tab);
    activeIndex.value = terminals.value.length - 1;
  }

  function removeTerminal(index: number) {
    if (index < 0 || index >= terminals.value.length) return;
    terminals.value.splice(index, 1);
    if (activeIndex.value >= terminals.value.length) {
      activeIndex.value = terminals.value.length > 0 ? terminals.value.length - 1 : 0;
    }
  }

  function setActiveIndex(index: number) {
    if (index >= 0 && index < terminals.value.length) {
      activeIndex.value = index;
    }
  }

  function clear() {
    terminals.value = [];
    activeIndex.value = 0;
  }

  return {
    terminals,
    activeIndex,
    addTerminal,
    removeTerminal,
    setActiveIndex,
    clear,
  };
});
