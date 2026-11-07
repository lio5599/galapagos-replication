; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %ar = alloca i32, align 4
  %br = alloca i32, align 4
  %dr = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %d, align 4
  %4 = load i32, ptr %a, align 4
  %sub3 = sub i32 25, %4
  store i32 %sub3, ptr %ar, align 4
  %5 = load i32, ptr %b, align 4
  %sub4 = sub i32 25, %5
  store i32 %sub4, ptr %br, align 4
  %6 = load i32, ptr %d, align 4
  %sub5 = sub i32 9, %6
  store i32 %sub5, ptr %dr, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %ar, align 4
  %or = or i32 %7, %8
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %9 = load i32, ptr %a, align 4
  %and6 = and i32 %and, %9
  store i32 %and6, ptr %x, align 4
  %10 = load i32, ptr %b, align 4
  %11 = load i32, ptr %br, align 4
  %or7 = or i32 %10, %11
  %not8 = xor i32 %or7, -1
  %shr9 = lshr i32 %not8, 8
  %and10 = and i32 %shr9, 255
  %12 = load i32, ptr %b, align 4
  %add = add i32 %12, 26
  %and11 = and i32 %and10, %add
  %13 = load i32, ptr %x, align 4
  %or12 = or i32 %13, %and11
  store i32 %or12, ptr %x, align 4
  %14 = load i32, ptr %d, align 4
  %15 = load i32, ptr %dr, align 4
  %or13 = or i32 %14, %15
  %not14 = xor i32 %or13, -1
  %shr15 = lshr i32 %not14, 8
  %and16 = and i32 %shr15, 255
  %16 = load i32, ptr %d, align 4
  %add17 = add i32 %16, 52
  %and18 = and i32 %and16, %add17
  %17 = load i32, ptr %x, align 4
  %or19 = or i32 %17, %and18
  store i32 %or19, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor = xor i32 %18, 43
  %sub20 = sub i32 0, %xor
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr22, 255
  %and24 = and i32 %and23, 62
  %19 = load i32, ptr %x, align 4
  %or25 = or i32 %19, %and24
  store i32 %or25, ptr %x, align 4
  %20 = load i32, ptr %u, align 4
  %xor26 = xor i32 %20, 47
  %sub27 = sub i32 0, %xor26
  %not28 = xor i32 %sub27, -1
  %shr29 = lshr i32 %not28, 8
  %and30 = and i32 %shr29, 255
  %and31 = and i32 %and30, 63
  %21 = load i32, ptr %x, align 4
  %or32 = or i32 %21, %and31
  store i32 %or32, ptr %x, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %x, align 4
  %sub33 = sub i32 0, %23
  %not34 = xor i32 %sub33, -1
  %shr35 = lshr i32 %not34, 8
  %and36 = and i32 %shr35, 255
  %24 = load i32, ptr %u, align 4
  %xor37 = xor i32 %24, 65
  %sub38 = sub i32 0, %xor37
  %shr39 = lshr i32 %sub38, 8
  %and40 = and i32 %shr39, 255
  %and41 = and i32 %and36, %and40
  %or42 = or i32 %22, %and41
  ret i32 %or42
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
