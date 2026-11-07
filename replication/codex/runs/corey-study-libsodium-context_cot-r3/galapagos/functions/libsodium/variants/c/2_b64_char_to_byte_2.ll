; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %not2 = xor i32 %sub1, -1
  %and = and i32 %not, %not2
  %shr = lshr i32 %and, 8
  %and3 = and i32 %shr, 255
  store i32 %and3, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub4 = sub i32 %3, 97
  %not5 = xor i32 %sub4, -1
  %4 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %4
  %not7 = xor i32 %sub6, -1
  %and8 = and i32 %not5, %not7
  %shr9 = lshr i32 %and8, 8
  %and10 = and i32 %shr9, 255
  store i32 %and10, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub11 = sub i32 %5, 48
  %not12 = xor i32 %sub11, -1
  %6 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %6
  %not14 = xor i32 %sub13, -1
  %and15 = and i32 %not12, %not14
  %shr16 = lshr i32 %and15, 8
  %and17 = and i32 %shr16, 255
  store i32 %and17, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub18 = sub i32 0, %xor
  %not19 = xor i32 %sub18, -1
  %shr20 = lshr i32 %not19, 8
  %and21 = and i32 %shr20, 255
  store i32 %and21, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor22 = xor i32 %8, 47
  %sub23 = sub i32 0, %xor22
  %not24 = xor i32 %sub23, -1
  %shr25 = lshr i32 %not24, 8
  %and26 = and i32 %shr25, 255
  store i32 %and26, ptr %q, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub27 = sub i32 %10, 65
  %and28 = and i32 %9, %sub27
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub29 = sub i32 %12, 71
  %and30 = and i32 %11, %sub29
  %or = or i32 %and28, %and30
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub31 = sub i32 %14, -4
  %and32 = and i32 %13, %sub31
  %or33 = or i32 %or, %and32
  %15 = load i32, ptr %p, align 4
  %and34 = and i32 %15, 62
  %or35 = or i32 %or33, %and34
  %16 = load i32, ptr %q, align 4
  %and36 = and i32 %16, 63
  %or37 = or i32 %or35, %and36
  store i32 %or37, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub38 = sub i32 0, %18
  %not39 = xor i32 %sub38, -1
  %19 = load i32, ptr %u, align 4
  %xor40 = xor i32 %19, 65
  %sub41 = sub i32 0, %xor40
  %and42 = and i32 %not39, %sub41
  %shr43 = lshr i32 %and42, 8
  %and44 = and i32 %shr43, 255
  %or45 = or i32 %17, %and44
  ret i32 %or45
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
