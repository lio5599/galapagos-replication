; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
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
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and = and i32 %not, %sub2
  %4 = load i32, ptr %x, align 4
  %or3 = or i32 %4, %and
  store i32 %or3, ptr %x, align 4
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %6
  %or6 = or i32 %sub4, %sub5
  %shr7 = lshr i32 %or6, 8
  %not8 = xor i32 %shr7, -1
  %7 = load i32, ptr %u, align 4
  %sub9 = sub i32 %7, 71
  %and10 = and i32 %not8, %sub9
  %8 = load i32, ptr %x, align 4
  %or11 = or i32 %8, %and10
  store i32 %or11, ptr %x, align 4
  %9 = load i32, ptr %u, align 4
  %sub12 = sub i32 %9, 48
  %10 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %10
  %or14 = or i32 %sub12, %sub13
  %shr15 = lshr i32 %or14, 8
  %not16 = xor i32 %shr15, -1
  %11 = load i32, ptr %u, align 4
  %sub17 = sub i32 %11, -4
  %and18 = and i32 %not16, %sub17
  %12 = load i32, ptr %x, align 4
  %or19 = or i32 %12, %and18
  store i32 %or19, ptr %x, align 4
  %13 = load i32, ptr %u, align 4
  %xor = xor i32 %13, 43
  %sub20 = sub i32 0, %xor
  %shr21 = lshr i32 %sub20, 8
  %not22 = xor i32 %shr21, -1
  %and23 = and i32 %not22, 62
  %14 = load i32, ptr %x, align 4
  %or24 = or i32 %14, %and23
  store i32 %or24, ptr %x, align 4
  %15 = load i32, ptr %u, align 4
  %xor25 = xor i32 %15, 47
  %sub26 = sub i32 0, %xor25
  %shr27 = lshr i32 %sub26, 8
  %not28 = xor i32 %shr27, -1
  %and29 = and i32 %not28, 63
  %16 = load i32, ptr %x, align 4
  %or30 = or i32 %16, %and29
  store i32 %or30, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %and31 = and i32 %17, 255
  store i32 %and31, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %cmp = icmp ne i32 %18, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %19 = load i32, ptr %x, align 4
  store i32 %19, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %20 = load i32, ptr %u, align 4
  %xor32 = xor i32 %20, 65
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  store i32 %and35, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %21 = load i32, ptr %retval, align 4
  ret i32 %21
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
