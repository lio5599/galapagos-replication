; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %not6 = xor i32 %shr5, -1
  %and7 = and i32 %not6, 255
  store i32 %and7, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 57, %6
  %or10 = or i32 %sub8, %sub9
  %shr11 = lshr i32 %or10, 8
  %not12 = xor i32 %shr11, -1
  %and13 = and i32 %not12, 255
  store i32 %and13, ptr %d, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %u, align 4
  %sub14 = sub i32 %8, 65
  %and15 = and i32 %7, %sub14
  %9 = load i32, ptr %b, align 4
  %10 = load i32, ptr %u, align 4
  %sub16 = sub i32 %10, 97
  %add = add i32 %sub16, 26
  %and17 = and i32 %9, %add
  %or18 = or i32 %and15, %and17
  %11 = load i32, ptr %d, align 4
  %12 = load i32, ptr %u, align 4
  %sub19 = sub i32 %12, 48
  %add20 = add i32 %sub19, 52
  %and21 = and i32 %11, %add20
  %or22 = or i32 %or18, %and21
  %13 = load i32, ptr %u, align 4
  %xor = xor i32 %13, 43
  %sub23 = sub i32 0, %xor
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 62
  %or27 = or i32 %or22, %and26
  %14 = load i32, ptr %u, align 4
  %xor28 = xor i32 %14, 47
  %sub29 = sub i32 0, %xor28
  %shr30 = lshr i32 %sub29, 8
  %not31 = xor i32 %shr30, -1
  %and32 = and i32 %not31, 63
  %or33 = or i32 %or27, %and32
  store i32 %or33, ptr %x, align 4
  %15 = load i32, ptr %x, align 4
  %16 = load i32, ptr %x, align 4
  %sub34 = sub i32 0, %16
  %shr35 = lshr i32 %sub34, 8
  %not36 = xor i32 %shr35, -1
  %and37 = and i32 %not36, 255
  %17 = load i32, ptr %u, align 4
  %xor38 = xor i32 %17, 65
  %sub39 = sub i32 0, %xor38
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %and42 = and i32 %and37, %and41
  %or43 = or i32 %15, %and42
  ret i32 %or43
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
