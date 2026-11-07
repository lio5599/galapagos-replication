; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %rejected = alloca i32, align 4
  %x = alloca i32, align 4
  %correction = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 -1, ptr %rejected, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 65
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %3
  %or = or i32 %sub1, %sub2
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %sub, %not
  %and3 = and i32 %and, 255
  %not4 = xor i32 %and3, -1
  %4 = load i32, ptr %rejected, align 4
  %and5 = and i32 %4, %not4
  store i32 %and5, ptr %rejected, align 4
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 71
  %6 = load i32, ptr %u, align 4
  %sub7 = sub i32 %6, 97
  %7 = load i32, ptr %u, align 4
  %sub8 = sub i32 122, %7
  %or9 = or i32 %sub7, %sub8
  %shr10 = lshr i32 %or9, 8
  %not11 = xor i32 %shr10, -1
  %and12 = and i32 %sub6, %not11
  %and13 = and i32 %and12, 255
  %not14 = xor i32 %and13, -1
  %8 = load i32, ptr %rejected, align 4
  %and15 = and i32 %8, %not14
  store i32 %and15, ptr %rejected, align 4
  %9 = load i32, ptr %u, align 4
  %sub16 = sub i32 %9, -4
  %10 = load i32, ptr %u, align 4
  %sub17 = sub i32 %10, 48
  %11 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %11
  %or19 = or i32 %sub17, %sub18
  %shr20 = lshr i32 %or19, 8
  %not21 = xor i32 %shr20, -1
  %and22 = and i32 %sub16, %not21
  %and23 = and i32 %and22, 255
  %not24 = xor i32 %and23, -1
  %12 = load i32, ptr %rejected, align 4
  %and25 = and i32 %12, %not24
  store i32 %and25, ptr %rejected, align 4
  %13 = load i32, ptr %u, align 4
  %xor = xor i32 %13, 43
  %sub26 = sub i32 0, %xor
  %shr27 = lshr i32 %sub26, 8
  %not28 = xor i32 %shr27, -1
  %and29 = and i32 62, %not28
  %not30 = xor i32 %and29, -1
  %14 = load i32, ptr %rejected, align 4
  %and31 = and i32 %14, %not30
  store i32 %and31, ptr %rejected, align 4
  %15 = load i32, ptr %u, align 4
  %xor32 = xor i32 %15, 47
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %not35 = xor i32 %shr34, -1
  %and36 = and i32 63, %not35
  %not37 = xor i32 %and36, -1
  %16 = load i32, ptr %rejected, align 4
  %and38 = and i32 %16, %not37
  store i32 %and38, ptr %rejected, align 4
  %17 = load i32, ptr %rejected, align 4
  %not39 = xor i32 %17, -1
  store i32 %not39, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub40 = sub i32 0, %18
  %shr41 = lshr i32 %sub40, 8
  %not42 = xor i32 %shr41, -1
  %19 = load i32, ptr %u, align 4
  %xor43 = xor i32 %19, 65
  %sub44 = sub i32 0, %xor43
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %not42, %shr45
  %and47 = and i32 %and46, 255
  store i32 %and47, ptr %correction, align 4
  %20 = load i32, ptr %rejected, align 4
  %21 = load i32, ptr %correction, align 4
  %not48 = xor i32 %21, -1
  %and49 = and i32 %20, %not48
  %not50 = xor i32 %and49, -1
  ret i32 %not50
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
