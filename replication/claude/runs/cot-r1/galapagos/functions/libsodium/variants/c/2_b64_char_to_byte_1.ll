; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %w = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %sub = sub i32 %1, 65
  %cmp = icmp ult i32 %sub, 26
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %w, align 4
  %sub1 = sub i32 %2, 65
  store i32 %sub1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, ptr %w, align 4
  %sub2 = sub i32 %3, 97
  %cmp3 = icmp ult i32 %sub2, 26
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %4 = load i32, ptr %w, align 4
  %sub5 = sub i32 %4, 97
  %add = add i32 %sub5, 26
  store i32 %add, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %5 = load i32, ptr %w, align 4
  %sub7 = sub i32 %5, 48
  %cmp8 = icmp ult i32 %sub7, 10
  br i1 %cmp8, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.end6
  %6 = load i32, ptr %w, align 4
  %sub10 = sub i32 %6, 48
  %add11 = add i32 %sub10, 52
  store i32 %add11, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end6
  %7 = load i32, ptr %w, align 4
  %cmp13 = icmp eq i32 %7, 43
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  store i32 62, ptr %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end12
  %8 = load i32, ptr %w, align 4
  %cmp16 = icmp eq i32 %8, 47
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  store i32 63, ptr %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end15
  %9 = load i32, ptr %w, align 4
  %cmp19 = icmp uge i32 %9, 65280
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end18
  %10 = load i32, ptr %w, align 4
  %cmp21 = icmp eq i32 %10, 65327
  %11 = zext i1 %cmp21 to i64
  %cond = select i1 %cmp21, i32 62, i32 63
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end18
  store i32 255, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then20, %if.then17, %if.then14, %if.then9, %if.then4, %if.then
  %12 = load i32, ptr %retval, align 4
  ret i32 %12
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
